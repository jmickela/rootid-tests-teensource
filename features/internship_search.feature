Feature: Search Internships
  In order to apply to internships
  As a web user
  I need to be able to find them first

  Rules:
  - Not selecting an option from the dropdown searches all available interships
  - Can select other Los Angeles County, In/Out Of LA, and Outside Los Angeles


  Background:
    Given I am on "/about/career-center/interns/available-internships-cfhc"

  @javascript
  Scenario:
    And I wait 500 milliseconds
    Then I should see "Los Angeles County"
    And I should see "In/Out Of LA"
    And I should see "Outside Los Angeles"