#!/usr/bin/ruby

$stdout.sync = true
$stderr.sync = true

require 'open-uri'
require 'openssl'

base_url = ENV["base_url"]
time_start = ENV["lower_bound"]
time_end = ENV["upper_bound"]
paths = ENV["url_paths"].split(",") unless ENV["url_paths"].nil? || ENV["url_paths"].empty?
username = ENV["username"]
password = ENV["password"]

def load_generator (base_url, time_start, time_end, paths, username, password)
    outstanding_requests = 0

    while true do
      endpoint = if paths.nil? then base_url else base_url + paths.sample() end
      options = {:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE}
      
      unless username.nil? || password.nil?
        options[:http_basic_authentication] = [username, password]
      end

      Thread.new do
        outstanding_requests = outstanding_requests + 1
        open(endpoint, options) do |response|
          puts "#{response.base_uri} returned #{response.status}"
        end
        outstanding_requests = outstanding_requests - 1 
        puts "#{outstanding_requests} outstanding requests"
      end
      sleep rand(time_start..time_end)
    end
end

load_generator(base_url, time_start.to_f, time_end.to_f, paths, username, password)
