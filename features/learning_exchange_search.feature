Feature: Search Learning Exchange
  In order to sign up for classes
  As a web user
  I need to be able to find them first

  Rules:
  - Calendar displays all classes in current month by default(as of 10/16/2016)
  - Search term is not required to conduct search
  - Dropdown option is not required to conduct search

  Background:
    Given I am on "/learning-exchange/calendar"

  Scenario Outline:
    When I fill in "keys" with "<search_term>"
    And I select "<option>" from "field_type_event_tid"
    And I press "edit-submit-calendar"
    Then I should see results or a no results message
#    Then I should see "<search_result>"
    Examples:
      |search_term|option|
      |           |Online Course|
      |Family Planning||
      |Orange County||
      ||Training|
      |Family Planning|Training|
