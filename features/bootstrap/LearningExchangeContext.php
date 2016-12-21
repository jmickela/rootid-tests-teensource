<?php

use Behat\Behat\Context\Context;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\MinkExtension\Context\MinkContext;
use Behat\MinkExtension\Context\RawMinkContext;

use Behat\Mink\Driver\Selenium2Driver;

require_once __DIR__.'/../../vendor/phpunit/phpunit/src/Framework/Assert/Functions.php';

/**
 * Defines application features from the specific context.
 */
class LearningExchangeContext extends RawMinkContext implements Context, SnippetAcceptingContext
{
    /**
     * Initializes context.
     *
     * Every scenario gets its own context instance.
     * You can also pass arbitrary arguments to the
     * context constructor through behat.yml.
     */
    public function __construct()
    {
    }

    /**
     * @return \Behat\Mink\Element\DocumentElement
     */
    private function getPage()
    {
        return $this->getSession()->getPage();
    }

   /**
     * @Then I should see :count results
     */
    public function iShouldSeeResults($count)
    {
        $results = $this->getPage()
            ->findAll('css', 'view-content');

        assertNotNull($results, 'Cannot find results!');

        assertCount(intval($count), $results->findAll('css', 'views-row views-field field-content'));
    }

    /**
     * @Then I should see results or a no results message
     */
    public function iShouldSeeResultsOrANoResultsMessage() {
        $notFoundText = $this->getPage()->find('named', array('content', 'There are no results for those search criteria. Please search again, or navigate back to the training calendar.'));
        $element = $this->getPage()->find('css', '.view-id-calendar.view-display-id-panel_pane_2 .views-row');

        if($notFoundText == null && $element == null)
            assertNotNull($notFoundText, 'A search result was not displayed and the no results message was not found.');
    }

    /**
     * @Then I should see a calendar element
     */
    public function iShouldSeeACalendarElement()
    {
        // element to find is class="calendar-calendar"
        $webElement = $this->getPage()
            ->find('css', '.calendar-calendar');

        assertNotNull($webElement, 'The calendar element was not found.');
    }

    /**
     * @When I mouse over an available class
     */
    public function iMouseOverAnAvailableClass()
    {
        $webElement = $this->getPage()
            ->find('css', '.tipsy>div'); // runs the actual query and returns the element

        assertNotNull($webElement, 'The class you are looking for is not on the calendar');

        // ok, let's hover it
        $webElement->mouseOver();
    }

    /**
     * @Then I should see a tooltip element
     */
    public function iShouldSeeATooltipElement()
    {
        throw new PendingException();
    }

    /**
     * @When I wait for the page to load
     */
    public function iWaitForThePageToLoad()
    {
        throw new PendingException();
    }

    /**
     * @Then I should see the previous month name
     */
    public function iShouldSeeThePreviousMonthName() {
        $last_month = date('F', strtotime('last month'));
        $this->assertSession()->pageTextContains($last_month);
    }

    /**
     * @Then I should see the next month name
     */
    public function iShouldSeeTheNextMonthName() {
        $last_month = date('F', strtotime('next month'));
        $this->assertSession()->pageTextContains($last_month);
    }

    /**
     * @Then I should see the current month name
     */
    public function iShouldSeeTheCurrentMonthName() {
        $this_month = date('F', strtotime('this month'));
        $this->assertSession()->pageTextContains($this_month);
    }
}
