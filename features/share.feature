Feature: Share Popup
  In order for users to share the site content
  I should be able to click the share button
  and share the page

  Background:
    Given I am on "/"

  @javascript
  Scenario:
    Then I should see a ".st_sharethis_custom" element
    And I click the ".st_sharethis_custom" element
    And I wait 1000 milliseconds
    And I should see a ".stLframe" element
    And I switch to the iframe "stLframe"
    Then I should see "Share this with your friends"