Feature: Automating guitar center website to ensure results of products


  Background:
    Given an user goes to guitarcenter.com

  Scenario:  1
    When they click on guitars under the products tab
    Then they can see list of brands of guitars

  Scenario: 2
    When they click on bass under the products menu
    Then they get redirected to http://www.guitarcenter.com/Bass.gc

  Scenario: 3
    When they select drums under the products menu
    Then they can see a list of drum and percussion items

  Scenario: 4
    When they click on the recording & software link under the products menu
    Then they can see quantities of models on each category of such product

   Scenario: 5
    When they click on search field and input "Petroleum"
    Then user gets zero results because its an invalid search word