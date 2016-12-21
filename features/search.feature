Feature: Search
  In order for users to find content
  they need to be able to use the search block
  and view the search results

  Background:
    Given I am on "/"

  Scenario:
    Then I should see a "#edit-search-block-form--2" element
    When I fill in "search_block_form" with "test"
    And I submit form "#search-block-form"
    Then I should see "Search results"
    And I should see a ".search-result" element