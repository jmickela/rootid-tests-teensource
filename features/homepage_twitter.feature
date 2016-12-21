Feature: Homepage Twitter Feed
  Background:
    Given I am on "/"

  Scenario:
    Then I should see "Latest Tweets"
    And I should see a ".twitter-timeline" element