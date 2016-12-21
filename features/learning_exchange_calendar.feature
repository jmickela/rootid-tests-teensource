Feature: Learning Exchange Calendar
  In order to access events
  As a web user
  I need to be able to see the calendar

  Rules:
  - Calendar displays all classes in current month by default

  Background:
    Given I am on "/learning-exchange/calendar"

  Scenario: Displaying the calendar
    Then I should see a calendar element
    And I should see a ".Training" element
    And I should see the current month name
    And I should see "Calendar Guide"
    And I should see "Webinar"

  Scenario: Displaying next month in the calendar
    When I follow "Next »"
    Then I should see the next month name

  Scenario: Displaying previous month in the calendar
    When I follow "« Prev"
    Then I should see the previous month name

  Scenario: The List link should send me to a list of events
    When I follow "List"
    Then I should see a ".view-display-id-panel_pane_2" element
    And I should see "find a training to match your needs?"

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
