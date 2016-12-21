Feature: Career Center
  In order to ensure proper display of the Career Center
  I should be able to see the employment opportunities section
  and the intern program section
  and all local menu items

  Background:
    Given I am on "/about/career-center"

  Scenario:
    Then I should see "Employment Opportunities"
    And I should see "Intern Program"
    And I should see "Jobs at Essential Access Health"
    And I should see "Jobs at Title X Agencies"
    And I should see "Open Doors Interns Program"

  Scenario Outline:
    Then I should see "<menu_item>"

    Examples:
      |menu_item|
      |Overview|
      |Supporters|
      |Press Room|
      |Career Center|
      |Contact Us|