#!/usr/bin/ruby

$stdout.sync = true
$stderr.sync = true

require 'open-uri'
require 'openssl'

base_url = ENV["base_url"]
time_start = ENV["lower_bound"]
time_end = ENV["upper_bound"]
paths = ENV["url_paths"].split(",")

def load_generator (base_url, time_start, time_end, paths)
  	while true do
  		endpoint = if paths.empty? then base_url else base_url + paths.sample() end
		open(endpoint, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}) do |response|
  			puts "#{response.base_uri} returned #{response.status}"
		end
		sleep rand(time_start..time_end)
  	end
end

load_generator(base_url, time_start.to_f, time_end.to_f, paths)
