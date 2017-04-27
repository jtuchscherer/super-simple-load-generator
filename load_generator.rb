#!/usr/bin/ruby

$stdout.sync = true
$stderr.sync = true

require 'open-uri'
require 'openssl'

uri = ENV["uri"]
time_start = ENV["lower_bound"]
time_end = ENV["upper_bound"]

def load_generator (uri, time_start, time_end)
  	while true do
		open(uri, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}) do |response|
  			puts "#{response.base_uri} returned #{response.status}"
		end
		sleep Random.rand(time_start..time_end)
  	end
end

load_generator(uri, time_start.to_f, time_end.to_f)
