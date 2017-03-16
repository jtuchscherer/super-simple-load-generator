require 'open-uri'
require 'openssl'

uri = ARGV[0]
time_interval = ARGV[1].to_i

if(ARGV.length != 2) 
	puts "Enter url followed by time time interval in seconds"
	exit
end

def load_generator (uri, time_interval_in_seconds)
  	while true do
		open(uri, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}) do |response|
  			puts response.status
		end
		sleep time_interval_in_seconds
  	end
end

load_generator(uri, time_interval)
