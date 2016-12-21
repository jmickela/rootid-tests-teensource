Feature: Resource Library
  In order to ensure proper display of resource library
  I should be able to see all the necessary views and panels
  and also some key text

  Background:
    Given I am on "/programs-and-services/resource-library"

  Scenario:
    Then I should see "Home / Programs + Services / Resource Library"
    And I should see "Welcome to the Essential Access Health Resource Library."
    And I should see "Keywords"
    And I should see "Resource Category"
    And I should see "Title X Extranet"

  Scenario Outline:
    Then I should see "<menu_item>"

    Examples:
      |menu_item|
      |Clinical Protocols|
      |Clinical Guidelines and Research|
      |Title X Program Management      |
      |Sample Forms                    |
      |Factsheets and Podcasts         |
      |Privacy Practices and HIPAA     |
      |Finance                         |

  Scenario Outline:
    Then I should see a "<class_name>" element

    Examples:
      |class_name               |
      |.resource-library-menu   |
      |.view-resource-taxonomy-list|

  Scenario Outline:
    And I should see "<resource_item>"

    Examples:
      |resource_item|
      |Preconception Care Policy|
      |PDPT for Trichomoniasis – Spanish|
      |Best Practices for Prevention and Early Detection of Repeat CT and GC|
      |Medical Justification for STD Testing Form                           |
      |CDPH Gonorrhea Treatment Update                                      |
      |Cost Allocation Plan                                                 |
      |HIPAA Privacy and Security Plan                                      |
      |Consent Form for Use of Language Interpreter                         |