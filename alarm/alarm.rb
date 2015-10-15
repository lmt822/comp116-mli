require 'packetfu'
require 'apachelogregex'
require 'base64'
def read_logfile(filename)
	inicident_num = 1
	# from github.com/weppos/apachelogregex
 	format = '%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"'
 	parser = ApacheLogRegex.new(format)

 	File.open(filename, 'r') do |f|
		f.each_line do |line|
			# parse log file
			log = parser.parse(line)
			# get ip and payload
			ip = log["%h"]
			payload = "#{log["%r"]} #{log["%{Referer"]} #{log["%{User-Agent}i"]}"
			# for protocol extraction, asked Carrie Xu
			protocol = line.split(' ')[-1].split('/')[0]
			if payload ==''
				protocol = 'HTTP'
			elsif protocol != 'HTTP' and protocol != 'RSTP' and protocol != 'HTTPS'
				protocol = 'HTTP'
			end

			if /Nmap/.match(log["%{User-Agent}i"])
				puts "#{inicident_num}. ALERT: Nmap scan is detected from #{ip} (#{protocol}) (#{payload}!"
				inicident_num += 1		
			elsif /Nikto/.match(log["%{User-Agent}i"])
				puts "#{inicident_num}. ALERT: Nikto is detected from #{ip} (#{protocol}) (#{payload}!"
				inicident_num += 1
			elsif /masscan/.match(log["%{User-Agent}i"])
				puts "#{inicident_num}. ALERT: Rob Graham's Masscan is detected from #{ip} (#{protocol}) (#{payload}!"
				inicident_num += 1
			elsif /shellshock/.match(log["%{User-Agent}i"])
				puts "#{inicident_num}. ALERT: Shellshock is detected from #{ip} (#{protocol}) (#{payload}!"
				inicident_num += 1
			elsif /phpMyAdmin/.match(log['%r'])
				puts "#{inicident_num}. ALERT: pertaining phpMyAdmin is detected from #{ip} (#{protocol}) (#{payload}!"
				inicident_num += 1
			elsif /\\x[0-9a-fA-f]{2}/.match(log['%r'])
				puts "#{inicident_num}. ALERT: Shellcode is detected from #{ip} (#{protocol}) (#{payload}!"
				inicident_num += 1
			end
		end
	end
end

def check_live_stream()
	inicident_num = 1
	stream = PacketFu::Capture.new(:start => true, :iface => 'eth0', :promisc => true)
	stream.stream.each do |p|
		curr_pkt = PacketFu::Packet.parse(p)
		if !curr_pkt.is_ip? or (curr_pkt.class.name != "PacketFu::TCPPacket" and curr_pkt.class.name != "PacketFu::UDPPacket" and curr_pkt.class.name != "PacketFu:ARPPacket")
			next
		end
		tcp_flag = nil
		pkt_body = curr_pkt.payload
		port = 0
		if (curr_pkt.class == "PacketFu::TCPPacket")
			port = curr_pkt.tcp_dst
			tcp_flag = curr_pkt.tcp_flags
			if tcp_flag.ack == 0 and tcp_flag.fin == 0 and tcp_flag.psh == 0 and tcp_flag.rst == 0 and tcp_flag.syn == 0 and tcp_flag.urg == 0
				#Null scan
				payload = pkt_body
				puts "#{inicident_num}. ALERT: NULL scan is detected from #{curr_pkt.ip_header.ip_saddr} (#{curr_pkt.proto.last} (#{payload})!"
				inicident_num += 1
			elsif tcp_flag.ack == 0 and tcp_flag.fin == 1 and tcp_flag.psh == 0 and tcp_flag.rst == 0 and tcp_flag.syn == 0 and tcp_flag.urg == 0
				#FIN scan
				payload = pkt_body
				puts "#{inicident_num}. ALERT: FIN scan is detected from #{curr_pkt.ip_saddr} (#{curr_pkt.proto.last} (#{payload})!"
				inicident_num += 1
			elsif tcp_flag.fin == 1 and tcp_flag.psh == 1 and tcp_flag.urg == 1
				#XSS scan
				payload = pkt_body
				puts "#{inicident_num}. ALERT: Xmas scan is detected from #{curr_pkt.ip_saddr} (#{curr_pkt.proto.last} (#{payload})!"
				inicident_num += 1
			end
		end
		if (curr_pkt.class.name == "PacketFu::UDPPacket")
			port = curr_pkt.udp_dst
		end
		if pkt_body != ""
			#credit card regex
			credit_card_regex = ['4\d{3}(\s|-)?\d{4}(\s|-)?\d{4}(\s|-)?\d{4}','5\d{3}(\s|-)?\d{4}(\s|-)?\d{4}(\s|-)?\d{4}','6011(\s|-)?\d{4}(\s|-)?\d{4}(\s|-)?\d{4}','3\d{3}(\s|-)?\d{6}(\s|-)?\d{5}']
			if /\x4E\x6D\x61\x70/.match(pkt_body)
				#Other Nmap scan
				payload = pkt_body
				puts "#{inicident_num}. ALERT: Nmap scan is detected from #{curr_pkt.ip_saddr} (#{curr_pkt.proto.last}! (#{payload})"
				inicident_num += 1
			elsif /\x4E\x69\x6B\x74\x6F/.match(pkt_body)
				#Nikto scan
				payload = pkt_body
				puts "#{inicident_num}. ALERT: Nikto scan is detected from #{curr_pkt.ip_saddr} (#{curr_pkt.proto.last}! (#{payload})"
				inicident_num += 1
			end
			if port == 80
				credit_card_regex.each do |reg|
					pay_load = curr_pkt.payload().each_byte.map { |b| sprintf(" 0x%02X ",b) }.join
					if /#{reg}/.match(pkt_body) 
						# credit card leak
						puts "#{inicident_num}. ALERT: Credit card leak is detected from #{curr_pkt.ip_saddr} (#{curr_pkt.proto.last}! (#{payload})"
						inicident_num += 1
					end
				end
			end
		end
	end
end



if ARGV[0] == '-r' && ARGV[1] != nil
	filename = ARGV[1]
	read_logfile(filename)
elsif ARGV[0] == nil
	check_live_stream()
else
	puts 'wrong'
end

