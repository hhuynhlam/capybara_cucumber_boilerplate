# frozen_string_literal: true
require 'capybara/cucumber'
require 'pry'

if (ENV['RUBY_ENV']) == 'development'
  require 'dotenv'

  Dotenv.load
end

Capybara.app_host = ENV['APP_URL']
Capybara.default_driver = :selenium
Capybara.default_wait_time = 5
Capybara.ignore_hidden_elements = false

Capybara.register_driver :selenium do |app|
  browser = (ENV['BROWSER']).to_sym

  Capybara::Selenium::Driver.new(app, browser: browser)
end
