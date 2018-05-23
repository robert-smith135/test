Feature: Home Page

    @front-page-cold-start
    Scenario: Visiting the front page - cold start
        Given I visit the front page
        And the search component is present

    @front-page-cold-start
    Scenario Outline: Autocomplete - road, settlement, airport, district
        Given I visit the front page
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

    @front-page-cold-start
    Scenario: Autocomplete - only appears when two or more characters entered
        Given I visit the front page
        When I type one character into the search box
        Then I expect to not see any auto complete results

    @front-page-cold-start
    Scenario: Autocomplete - doesnt work for foreign locations
        Given I visit the front page
        When I type into the search box a foreign location name
        Then I expect to not see any auto complete results

    @front-page-cold-start
    Scenario Outline: Autocomplete - only appears for UK only locations
        Given I visit the front page
        When I type into the search box a correct <location> name
        Then I expect the auto complete to work and show <number> of locations
        Examples:
            | location | number |
            | New York | 1      |

    Scenario Outline: Excape key to close the auto complete
        Given I visit the front page
        When I type into the search box a correct <location> name
        And I expect the auto complete to work and show <number> of locations
        And I press the escape key
        Then I expect to not see any auto complete results
        Examples:
            | location | number |
            | ob       | 4      |

    @front-page-cold-start
    Scenario: Search for a location that returns search count
        Given I visit the front page
        When I type into the search box a correct Cardiff name
        And I press enter in the search field
        Then I expect to see the search result count
        And I expect to see the search count for Cardiff for the front page

    @front-page-cold-start
    Scenario: Error for incorrect location (search term)
        Given I visit the front page
        And a name of a location is in the search box but it's not correct
        And I press enter in the search field
        Then I expect to be shown an error message indicating that the location name could not be found
