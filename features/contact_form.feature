Feature: Contact Form
  In order to conveniently connect with someone at CFHC
  As a web user
  I need to be able to use the contact form

  Rules:
  - Name is a required field
  - Email is a required field
  - Subject is a required field

  Background:
    Given I am on "/about/contact-us"

  Scenario Outline:
    When I fill in "Name" with "<user_name>"
    And I fill in "Organization / Company" with "<company>"
    And I fill in "Email" with "<email>"
    And I fill in "Subject" with "<subject>"
    And I fill in "Body" with "<body>"
    And I press the submit button
    Then I should be on "<page>"
    Examples:
      |user_name|company|email|subject|body|page|
      ||rootid|armando.b.carmona@gmail.com|behatTest|Test|/403-error|
      |Behat Tester|rootid||behatTest|Test|/403-error|
      |Behat Tester|rootid|armando.b.carmona@gmail.com||Test|/403-error|
      |Behat Tester|rootid|||Test|/403-error|
      ||rootid|armando.b.carmona@gmail.com||Test|/403-error|
      ||rootid||behatTest|Test|/403-error|
      