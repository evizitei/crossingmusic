Feature: Viewing the Results of the voting
  As a Crossing administrator
  I want to see graphs of the voting results
  In order to guide my decisions about which songs to pick for recording our albums
  
  Scenario: Navigating to the charts area
    Given I am logged in as "David"
    When I follow "Charts"
    Then I should see a bar chart for all songs
    