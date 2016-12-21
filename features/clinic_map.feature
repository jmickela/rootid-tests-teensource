Feature: Clinic Map
  Background:
    Given I am on "/programs-and-services/clinic-map"

  @javascript
  Scenario:
    And I fill in "distance[postal_code]" with "94590"
    And I press "edit-submit-clinic-map"
    And I wait 2000 milliseconds
    Then I should see "Vallejo"

  @javascript
  Scenario:
    And I wait 2000 milliseconds
    Then I should see a ".gmap-processed" element
    And I should not see a ".gm-err-container" element