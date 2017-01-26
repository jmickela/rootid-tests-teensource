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
class CAPFormContext extends RawMinkContext implements Context
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
     * @When I enter a birthdate for a 11 year old
     */
    public function iEnterTheBirthdateForA11YearOld() {
        $page    = $this->getSession()->getPage();
        $element = $page->findAll('css', "#edit-field-birth-date-und-0-value-date");
        $val = strtotime("12 years ago +1 day");
        $element[0]->setValue(date("m/d/Y", $val));
    }

    /**
 * @When I enter a birthdate for a 20 year old
 */
    public function iEnterTheBirthdateForA20YearOld() {
        $page    = $this->getSession()->getPage();
        $element = $page->findAll('css', "#edit-field-birth-date-und-0-value-date");
        $val = strtotime("20 years ago");
        $element[0]->setValue(date("m/d/Y", $val));
    }

    /**
     * @When I enter a birthdate for a 16 year old
     */
    public function iEnterTheBirthdateForA16YearOld() {
        $page    = $this->getSession()->getPage();
        $element = $page->findAll('css', "#edit-field-birth-date-und-0-value-date");
        $val = strtotime("16 years ago");
        $element[0]->setValue(date("m/d/Y", $val));
    }
}