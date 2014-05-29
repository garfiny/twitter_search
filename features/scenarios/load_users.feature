@javascript
Feature: load twitter users randomly
    In order to perform search function, we need to load users from twitter.
    We can apply this by clicking on load users button on front page. 
    It will automatically load random users from twitter.

    Scenario: load twitter users
        When I click on 'Load Users' button
        Then There should be popup window show up
         And There should be a backend thread to load users from twitter
         And Once it finish loading, the result should be displayed
