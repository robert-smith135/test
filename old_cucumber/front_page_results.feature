Feature: Home Page
    @front-page-results
    Scenario: Results for Cardiff are saved via cookie
        Given I visit the front page
        And The local news section is present
        And search component is present
        And I wait for 5 seconds
        When I type into the search box a correct Cardiff name
        And I wait for 3 seconds
        Then Close location search is present
        And I click on first result
        And a confirmation message for Cardiff is displayed
        And I visit the front page
        Then the results for Cardiff are displayed
        And there are 5 articles displayed
        And I visit the front page
        Then the results for Cardiff are displayed
        And there are 5 articles displayed
