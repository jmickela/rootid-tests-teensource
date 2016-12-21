Feature: Homepage layout
  In order to ensure proper display of homepage
  I should be able to see all main menu links
  and the what's hot section
  and the find a clinic widget
  and the slider
  and the newsletter subscribe widget
  and assorted other blocks

  Background:
    Given I am on "/"

  Scenario Outline: Main page elements should be visible.
    Then I should see "<page_text>"

    Examples:
      |page_text                                   |
      |Latest News Updates                         |
      |What's Hot                                  |
      |Sign up for hookup                          |
      |Meet our peer educators                     |
      |Visit Blog                                  |

  Scenario Outline: Main Menu items should all be visible.
    Then I should see "<menu_item>"

    Examples:
      |menu_item|
      |Find a Clinic       |
      |Birth Control       |
      |STDs                |
      |Relationships       |
      |Blogs               |
      |Know Your Rights    |

  Scenario: Newsletter signup should have fields for phone number, year born, and zip code
    Then I should see "Mobile Phone Number"
    And I should see "Year You Were Born"
    And I should see "Zip Code"

  Scenario: The find a clinic widget should be visible and working.
    Then I should see a ".pane-views-exp-clinics-map-page-3" element
    And I should see "Postal Code"
    And I should see "Miles"
    And I should see "Search"
    And I fill in "zip_code" with "94590"
    And I press "submit"
    And I should see "Did you visit a clinic near you?"
    

#  Scenario Outline:
#    Then I should see a "<class_name>" element
#
#    Examples:
#      |class_name               |
#      |#region-menu             |
#      |.panels-flexible-1-inside|
#      |.frontpage-image         |
#      |.panels-flexible-row-1-1 |
#      |#node-page-9             |
#      |.pane-block-3            |
#      |.panels-flexible-region-1-events|
#      |.view-homepage-upcoming-events  |
