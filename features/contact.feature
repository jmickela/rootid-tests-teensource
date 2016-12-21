Feature: Contact Us
  In order to for users to contact us
  The need to be able to see the contact form
  and other contact information

  Background:
    Given I am on "/about/contact-us"

  Scenario:
    Then I should see "Contact Us"
    And I should see "Name"
    And I should see "Email"
    And I should see "Our Locations"
    And I should see "Find us on social media too!"