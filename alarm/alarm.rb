require 'packetfu'
$inicident_num = 0

def read_logfile(filename)
	f = File.open(filename, 'r')
	f.each_line do |line|
		# parse log file
		pattern = /^(\S+).*\s(.*)\s\S*\s(\d+)/
		string = pattern.match(line)
		puts string[0]
	end

end

def check_live_stream()

end



if ARGV[0] == '-r' && ARGV[1] != nil
	filename = ARGV[1]
	puts '1'
	read_logfile(filename)
elsif ARGV[0] == nil
	puts '2'
#	check_live_stream()
else
	puts '3'
end
#stream = PacketFu::Capture.new(:start => true, :iface => 'eth0', :promisc => true)
#stream.show_live()
