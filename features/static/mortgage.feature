Feature: Mortgage calculator
  A user should be able to use the mortgage calculator

  Background:
    Given I visit "/mortgage"

  @javascript
  Scenario: Viewing page
    Then I should see "MORTGAGE CALCULATOR"

  @javascript
  Scenario: Using the calculator
    When I fill in "purchase" with ""
    And I fill in "purchase" with "0"
    And I fill in "purchase" with "500000"
    And I fill in "interest" with ""
    And I fill in "interest" with "0"
    And I fill in "interest" with "2.6"
    And I fill in "term" with ""
    And I fill in "term" with "0"
    And I fill in "term" with "25"
    And I fill in "down" with ""
    And I fill in "down" with "0"
    And I fill in "down" with "40000"
    Then I should see "$ 460,000"
    And I should see "2.60%"
    And I should see "weekly"
    And I should see "25 years"
    And I should see "$ 481.30"
    And I should see "1300"
    And I should see "$ 625,693.95"
    And I should see "$ 165,693.95"
