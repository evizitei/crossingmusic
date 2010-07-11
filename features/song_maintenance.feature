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