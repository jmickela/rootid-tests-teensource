Feature: Press Room
  In order to ensure proper display of the Press Room
  I should be able to see all three sections
  and all local menu items
  and also some key text

  Background:
    Given I am on "/about/press-room"

  Scenario:
    Then I should see "Featured News"
    And I should see "Press Releases"
    And I should see "In the News"
    And I should see "Media Inquiries"

  Scenario Outline:
    Then I should see "<menu_item>"

    Examples:
      |menu_item|
      |Overview|
      |Supporters|
      |Press Room|
      |Career Center|
      |Contact Us|