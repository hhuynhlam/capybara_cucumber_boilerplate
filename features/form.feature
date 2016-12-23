@form
Feature: Form

Scenario: Submitting a valid form
Given I am logged in
  And I am on /form
When I enter '[Regression] Test Form' as the name
  And I upload valid Text file
  And I submit the form
Then I should see form is submitted successfully
