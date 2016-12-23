@authentication
Feature: Authentication

Scenario: Visiting the home page when not logged in
Given I am not logged in
When I visit the home page
Then I should see 404 page

Scenario: Visiting the home page when logged in
Given I am logged in
When I visit the home page
Then I should see form
