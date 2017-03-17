#!/usr/bin/ruby

require 'open-uri'
require 'openssl'

uri = ENV["uri"]
time_interval = ENV["time_interval_in_seconds"]

def load_generator (uri, time_interval_in_seconds)
  	while true do
		open(uri, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}) do |response|
  			puts response.status
		end
		sleep time_interval_in_seconds
  	end
end

load_generator(uri, time_interval.to_i)
