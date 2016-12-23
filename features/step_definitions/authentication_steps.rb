# frozen_string_literal: true
Given(/^I am logged in$/) do
  visit('/')

  browser = Capybara.current_session.driver.browser

  browser.manage.add_cookie(
    name: 'access_token',
    value: 'TOKEN'
  )
end

Given(/^I am not logged in$/) do
  visit('/')

  browser = Capybara.current_session.driver.browser

  browser.manage.delete_all_cookies
end

When(/^I visit the home page$/) do
  visit('/')
end

Then(/^I should see 404 page$/) do
  expect(page).to have_content('404')
end

Then(/^I should see form$/) do
  expect(page).to have_content('Form')
end
