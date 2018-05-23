Feature: Home Page

    @topic-page-cold-start
    Scenario: Visiting the topic page - cold start
        Given I visit the topic page
        And search component is present

    @topic-page-cold-start
    Scenario Outline: Autocomplete - road, settlement, airport, district
        Given I visit the topic page
        When I type into the search box a correct <location> name
        Then I expect the auto complete to work and show <number> of locations
        Examples:
            | location            | number |
            | Cardiff             | 2      |
            | np16                | 1      |
            | manchester          | 3      |
            | ob                  | 4      |
            | oban                | 2      |
            | London              | 10     |
            | Ystrad-ffin         | 1      |
            | Bishop's            | 10     |
            | Low Fell & Chowdene | 1      |


    @topic-page-cold-start
    Scenario: Autocomplete - only appears when two or more characters entered
        Given I visit the topic page
        When I type one character into the search box
        Then I expect to not see any auto complete results


    @topic-page-cold-start
    Scenario: Autocomplete - doesnt work for foreign locations
        Given I visit the topic page
        When I type into the search box a foreign location name
        Then I expect to not see any auto complete results


    @topic-page-cold-start
    Scenario Outline: Autocomplete - only appears for UK only locations
        Given I visit the topic page
        When I type into the search box a correct <location> name
        Then I expect the auto complete to work and show <number> of locations
        Examples:
            | location | number |
            | New York | 1      |


    @topic-page-cold-start
    Scenario Outline: Excape key to close the auto complete
        Given I visit the topic page
        When I type into the search box a correct <location> name
        And I expect the auto complete to work and show <number> of locations
        And I press the escape key
        Then I expect to not see any auto complete results
        Examples:
            | location | number |
            | ob       | 4      |


    @topic-page-cold-start
    Scenario: Search for a location that returns search count
        Given I visit the topic page
        When I type into the search box a correct Cardiff name
        And I press enter in the search field
        Then I expect to see the search result count
        And I expect to see the search count for Cardiff

    @topic-page-cold-start
    Scenario: Error for incorrect location (search term)
        Given I visit the topic page
        When I type into the search box a correct Incirrect name
        And I press enter in the search field
        Then I expect to be shown an error message indicating that the location name could not be found

    @topic-page-cold-start
    Scenario: Arriving on results page
        Given I visit the topic page
        And I type into the search box a correct Cardiff name
        And I press enter in the search field
        And I click on first result
        Then I expect to be taken to the local news results page for this location

    @autolocation-on
    Scenario: Geolocation Automatic redirect
        Given I visit the LTP home page
        And I wait for 5 seconds
        Then I expect to not to be on the local news cold start page

    @autolocation-on
    Scenario: No redirect when visiting specific LTP
      Given I visit the topic page
      Then I visit the Cardiff Results R0 page
      Then I wait for 5 seconds
      Then I expect to not be taken to the Llandaff results page
