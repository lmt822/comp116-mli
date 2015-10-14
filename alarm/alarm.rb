require 'packetfu'
require 'apachelogregex'

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

end



if ARGV[0] == '-r' && ARGV[1] != nil
	filename = ARGV[1]
	read_logfile(filename)
elsif ARGV[0] == nil
#	check_live_stream()
else
	puts 'wrong'
end
#stream = PacketFu::Capture.new(:start => true, :iface => 'eth0', :promisc => true)
#stream.show_live()
