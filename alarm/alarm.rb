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
		puts pkt_body
		if (curr_pkt.class.name == "PacketFu:TCPPacket")
			tcp_flag = curr_pkt.tcp_header.tcp_flags.to_i
			if tcp_flag == 0
				#Null scan
				payload = pkt_body
				puts "#{inicident_num}. ALERT: NULL scan is detected from #{curr_pkt.ip_header.ip_saddr} (#{curr_pkt.proto.last} (#{payload})!"
				inicident_num += 1
			elsif tcp_flag == 1
				#FIN scan
				payload = pkt_body
				puts "#{inicident_num}. ALERT: FIN scan is detected from #{curr_pkt.ip_saddr} (#{curr_pkt.proto.last} (#{payload})!"
				inicident_num += 1
			elsif tcp_flag == 41
				#XSS scan
				payload = pkt_body
				puts "#{inicident_num}. ALERT: Xmas scan is detected from #{curr_pkt.ip_saddr} (#{curr_pkt.proto.last} (#{payload})!"
				inicident_num += 1
			end
		end
		if pkt_body != ""
			#credit card regex
			credit_card_regex = ['4\d{3}(\s|-)?\d{4}(\s|-)?\d{4}(\s|-)?\d{4}','5\d{3}(\s|-)?\d{4}(\s|-)?\d{4}(\s|-)?\d{4}','6011(\s|-)?\d{4}(\s|-)?\d{4}(\s|-)?\d{4}','3\d{3}(\s|-)?\d{6}(\s|-)?\d{5}','\d{4}(\s|-)?\d{4}(\s|-)?\d{4}(\s|-)?\d{4}']
			if /Nmap/.match(pkt_body)
				#Other Nmap scan
				payload = base64.encode64(pkt_body)
				puts "#{inicident_num}. ALERT: Nmap scan is detected from #{curr_pkt.ip_saddr} (#{curr_pkt.proto.last}! (#{payload})"
				inicident_num += 1
			elsif /Nikto/.match(pkt_body)
				#Nikto scan
				payload = base64.encode64(pkt_body)
				puts "#{inicident_num}. ALERT: Nikto scan is detected from #{curr_pkt.ip_saddr} (#{curr_pkt.proto.last}! (#{payload})"
				inicident_num += 1
			end
			credit_card_regex.each do |reg|
				if "/#{reg}/".match(pkt_body) 
					# credit card leak
					payload = base64.encode64(pkt_body)
					puts "#{inicident_num}. ALERT: Credit card leak is detected from #{curr_pkt.ip_saddr} (#{curr_pkt.proto.last}! (#{payload})"
					inicident_num += 1
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

