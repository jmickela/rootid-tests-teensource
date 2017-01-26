Feature: Condom Access Project
  In order to provide condoms for the youths
  the CAP workflow needs to work properly
  and the order form needs to function properly

  Background:
    Given I am on "/condoms/free"

  Scenario: I should see the CAP form
    Then I should see "Get Free Condoms"
    And I should see "Enter your city"
    And I should see "Enter your zip code"
    And I should see "Enter your date of birth"

  Scenario Outline: All CAP fields should be required.
    When I fill in "Enter Your City *" with "<city>"
    And I fill in "Enter Your Zip Code *" with "<zip>"
    And I fill in "Date" with "<birthdate>"
    And I press "edit-submit"
    Then I should see "<result>"

    Examples:
      |city                     |zip                      |birthdate  |result                                    |
      |                         |                         |           |Enter Your City field is required.        |
      |                         |                         |           |Enter Your Zip Code field is required.    |
      |                         |                         |           |A valid date is required for Enter Your Date of Birth.   |

  Scenario: You must be at least 12 years old to use the cap form.
    When I fill in "Enter Your City *" with "Vallejo"
    And I fill in "Enter Your Zip Code *" with "94590"
    And I enter a birthdate for a 11 year old
    And I press "edit-submit"
    Then I should see "We’re sorry, CAP only provides free condoms to California youth, ages 12-19."

  Scenario: You must be under 20 years old to use the cap form.
    When I fill in "Enter Your City *" with "Vallejo"
    And I fill in "Enter Your Zip Code *" with "94590"
    And I enter a birthdate for a 20 year old
    And I press "edit-submit"
    Then I should see "We’re sorry, CAP only provides free condoms to California youth, ages 12-19."

  Scenario: If you're not in the CAP service area, you should be directed to the free condoms map.
    When I fill in "Enter Your City *" with "El Cerrito"
    And I fill in "Enter Your Zip Code *" with "94530"
    And I enter a birthdate for a 16 year old
    And I press "Get Your Condoms!"
    Then I should see "FIND FREE CONDOMS"
