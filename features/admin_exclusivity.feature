Feature:  The administrative area should require a login
  As a Crossing administrator
  I want to have maintenance areas unavailable to the public
  So that only we few chosen can administer the worship ministry's data
  
  Scenario: Logging in
    Given there is a user with name "David", email "david.cover@crossing.com", and password "kingdomcome"
    When I go to the homepage
      And I follow "Login"
      And I fill in "Email:" with "david.cover@crossing.com"
      And I fill in "Password:" with "kingdomcome"
      And I press "Login"
    Then I should see "David"
    
  Scenario: Logging Out
    Given I am logged in as "David"
      And I am on the homepage
      And I should not see "Login"
      And I should see "David"
    When I follow "Logout"
    Then I should be on the homepage
      And I should not see "David"
      And I should see "Login"
      
  Scenario: Should only be able to add a song if you are logged in
    Given I am on the songs page
      And I should not see "Add a Song"
    When I am logged in as "David"
      And I am on the songs page
    Then I press "Add a Song"
    
  Scenario: Should only be able to see the Charts tab if you are logged in
    Given I am on the homepage
      And I should not see "Charts"
    When I am logged in as "David"
      And I am on the homepage
    Then I should see "Charts"