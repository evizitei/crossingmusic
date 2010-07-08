Feature: Arriving at the Homepage
  As a congregant
  I want to see all relevant navigation options on the homepage
  In order to effectively find what information I am looking for
  
  Scenario: Arriving on homepage for first the time
    Given I am an unknown user
    When I go to the homepage
    Then I should see "The Crossing"