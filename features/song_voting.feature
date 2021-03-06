Feature: Voting on songs for recording at the crossing
  As a congregant
  I want to see a list of songs to vote on, listen to them, and cast my vote
  In order to register my preferences with the music team
    
  Scenario: Playing a song
    Given I am an unknown user
      And there is a song called "Come as you are"
      And I am on the songs page
    When I follow "Come as you are"
    Then I should see an mp3 widget for the song "Come as you are"
      And I should see "The Crossing Music Demos"
    
  Scenario: Navigating to another song
    Given I am an unknown user
      And there is a song called "Come as you are"
      And there is a song called "Creator King"
      And I am on the songs page 
    When I follow "Come as you are"
      And I follow "Creator King"
    Then I should see an mp3 widget for the song "Creator King"

  Scenario: Giving a song a positive vote
    Given I am an unknown user
      And there is a song called "Come as you are" in position 1
      And there is a song called "Creator King" in position 2
      And I am on the songs page
      And the song "Come as you are" should have 0 positive votes
    When I follow "Come as you are"
      And I press "Like It"
    Then I should be on the song voting page for Creator King
      And the song "Come as you are" should have 1 positive vote
    
  Scenario: Giving a song a negative vote
    Given I am an unknown user
      And there is a song called "Come as you are" in position 1
      And there is a song called "Creator King" in position 2
      And I am on the songs page
      And the song "Come as you are" should have 0 negative votes
    When I follow "Come as you are"
      And I press "Not For Me"
    Then I should be on the song voting page for Creator King
      And the song "Come as you are" should have 1 negative vote
  
  Scenario: Giving a song a neutral vote
    Given I am an unknown user
      And there is a song called "Come as you are" in position 1
      And there is a song called "Creator King" in position 2
      And I am on the songs page
      And the song "Come as you are" should have 0 neutral votes
    When I follow "Come as you are"
      And I press "Neutral"
    Then I should be on the song voting page for Creator King
      And the song "Come as you are" should have 1 neutral vote
    
  Scenario: Voting on the last song in the list goes back to index
    Given I am an unknown user
      And there are no songs to start with
      And there is a song called "Come as you are"
      And I am on the songs page
    When I follow "Come as you are"
      And I press "Like It"
    Then I should be on the songs page
    
  Scenario: resetting votes returns count to zero
    Given I am logged in as "David"
      And there is a song called "Come as you are" with "3" positive votes
    When I follow "Charts"
      And I press "Reset Votes"
    Then the song "Come as you are" should have 0 positive votes
    