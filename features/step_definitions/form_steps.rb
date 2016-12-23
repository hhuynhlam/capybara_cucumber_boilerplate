# frozen_string_literal: true
Given(%r{^I am on /form$}) do
  visit('/form')
end

When(/^I enter '(.*)' as the name$/) do |name|
  find('[data-e2e=name]').set(name)
end

When(/^I upload valid (.*) file$/) do |type|
  fill_in_upload("FileUpload#{type}")
end

When(/^I submit the form$/) do
  find('[data-e2e=SubmitButton]:not([disabled])').click
end

Then(/^I should see form is submitted successfully$/) do
  find('[data-e2e=FormSuccess]')

  expect(page).to have_content('Success!')
end
