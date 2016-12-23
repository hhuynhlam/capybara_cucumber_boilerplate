# frozen_string_literal: true
require 'dotenv/tasks' if (ENV['RUBY_ENV']) == 'development'
require 'json'
require 'net/http'
require 'uri'

task default: %w(chrome)

task 'chrome' => (:dotenv if (ENV['RUBY_ENV']) == 'development') do
  sh 'cucumber'
end

task 'run' => (:dotenv if (ENV['RUBY_ENV']) == 'development') do
  response = codeship_builds
  latest_build_id = JSON.parse(response.body)['builds'][0]['id']
  trigger_build(latest_build_id)
end

private

CODESHIP_API = 'https://codeship.com/api/v1'

def codeship_builds
  uri = URI.parse([
    "#{CODESHIP_API}/projects",
    "/#{ENV['CODESHIP_API_PROJECT_ID']}.json",
    "?api_key=#{ENV['CODESHIP_API_KEY']}"
  ].join)

  Net::HTTP.get_response(uri)
end

def trigger_build(build_id)
  uri = URI.parse([
    "#{CODESHIP_API}/builds",
    "/#{build_id}/restart.json",
    "?api_key=#{ENV['CODESHIP_API_KEY']}"
  ].join)

  request = Net::HTTP::Post.new(uri)

  Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
    http.request(request)
  end
end
