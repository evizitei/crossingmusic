Feature: managing the current list of songs
  As a crossing admin
  I want to add, edit, and delete songs in our setlist
  In order to control what songs people are voting on
  
  Scenario: Viewing song list
    Given there is a song called "Come as you are"
      And there is a song called "here I am to worship"
      And there is a song called "In Christ Alone"
      And I am logged in as "David"
      And I am on the homepage
    When I follow "Songs"
    Then I should see "Come as you are"
      And I should see "here I am to worship"
      And I should see "In Christ Alone"
      
  Scenario: Adding a song
    Given I am logged in as "David"
      And I am on the songs page
    When I press "Add a Song"
      And I fill in "Name:" with "Some New Song"
      And I attach a "recording" "mp3" file to a "song" on S3
      And I press "Save"
    Then I should be on the songs page
      And I should see "Some New Song"