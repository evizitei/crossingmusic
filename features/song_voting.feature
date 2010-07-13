Feature: Voting on songs for recording at the crossing
  As a congregant
  I want to see a list of songs to vote on, listen to them, and cast my vote
  In order to register my preferences with the music team
  
  Scenario: navigating to song voting area
    Given I am an unknown user
      And I am on the homepage
    When I follow "Songs"
    Then I should see "Playlist"
    When I follow "Home"
    Then I should not see "Playlist"
    
  Scenario: Playing a song
    Given I am an unknown user
      And there is a song called "Come as you are"
      And I am on the songs page
    When I follow "Come as you are"
    Then I should see an mp3 widget for the song "Come as you are"
    
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
      And there is a song called "Come as you are"
      And there is a song called "Creator King"
      And I am on the songs page
      And the song "Come as you are" should have 0 positive votes
    When I follow "Come as you are"
      And I press "Love it!"
    Then I should be on the song voting page for Creator King
      And the song "Come as you are" should have 1 positive vote
    
    
    