Feature: Topic Page

@topic-page
Scenario: Visit topic page for cardiff
    Given I visit the Cardiff Results R0 page
    And correct cardiff title present
    And promoted content is present
    And LTP search component is present
    And radius is present
    And stream is present
    And stream count is present

@topic-page
Scenario: Radius buttons availability
    Given I visit the Cardiff Results R0 page
    And radius is present
    Then I should see 5 radius buttons
    And the radius buttons should appear in the correct order

@topic-page
Scenario Outline: Choosing a selected radius
    Given I visit the Cardiff Results R0 page
    And I click the radius button for <radius>
    Then the <url> is changed to reflect navigation for results
    And the clicked <radius> button is selected
    And promoted content is displayed
    Examples:
    | radius | url                 |
    | 0      | /2653822-cardiff/0  |
    | 5      | /2653822-cardiff/5  |
    | 10     | /2653822-cardiff/10 |
    | 15     | /2653822-cardiff/15 |
    | 20     | /2653822-cardiff/20 |

@topic-page
Scenario: Geolocation button styling on front page slice
  Given I visit the Cardiff Results R0 page
  And I click the compact search button
  Then I expect to see the geolocation button
  And I click on the geolocation button

@topic-page
Scenario: Geolocation button click
  Given I visit the Cardiff Results R0 page
  And I click the compact search button
  Then I expect to see the geolocation button
  And I click on the geolocation button
  Then I expect the message notifying user to set his local news location
  And I expect to log my action using a yes or no button

@topic-page
Scenario: CPS stream post behaves as expected
    Given I visit the Cardiff Results R0 page
    And I click on a CPS stream post
    Then I expect to be redirected away from the topic page

# Theres no reliable way to test the beloew as we dont know if a location has a vivo post 
Scenario: Vivo post behaves as expected
    Given I visit the London Results R20 page
    Then vivo post is displayed as expected
    Given I click on a vivo post
    Then PENDING: confirm pinned post

@topic-page
Scenario: CPS post behaves as expected
    Given I visit the London Results R20 page
    Then cps post is displayed as expected

@topic-page
Scenario: Set as your local news confirmation
    Given I visit the Cardiff Results R0 page
    Then I click the 'Yes' confirmation button to set location as your local news
    And I wait for 5 seconds
    Then I expect to be shown the confirmation message

@topic-page
Scenario: Locserve cookie is set and read correctly
    Given I visit the Cardiff Results R0 page
    Then I click the compact search button
    When I type into the search box a correct London name
    And I press enter in the search field
    And I wait for 1 second
    And I click on first result
    Then I expect to be taken to the local news results page for london
    And I wait for 5 seconds
    Then I click the 'Yes' confirmation button to set location as your local news
    And I wait for 2 seconds
    Then I visit the LTP home page
    Then I expect to be automatically redirected to the local news results page for london

@topic-page
Scenario: Autocomplete - only appears when two or more characters entered
    Given I visit the Cardiff Results R0 page
    Then I click the compact search button
    When I type one character into the search box
    Then I expect to not see any auto complete results

@topic-page
Scenario: Autocomplete - doesnt work for foreign locations
    Given I visit the Cardiff Results R0 page
    Then I click the compact search button
    When I type into the search box a foreign location name
    When I expect to not see any auto complete results

@topic-page
Scenario Outline: Autocomplete - only appears for UK only locations
    Given I visit the Cardiff Results R0 page
    Then I click the compact search button
    When I type into the search box a correct <location> name
    Then I expect the auto complete to work and show <number> of locations
    Examples:
          | location | number |
          | New York | 1      |

@topic-page
Scenario Outline: Escape key to close the auto complete
    Given I visit the Cardiff Results R0 page
    Then I click the compact search button
    When I type into the search box a correct <location> name
    And I expect the auto complete to work and show <number> of locations
    And I press the escape key
    Then I expect to not see any auto complete results
    Examples:
        | location | number |
        | ob       | 4      |

@topic-page
Scenario: Search for a location that returns search count
    Given I visit the Cardiff Results R0 page
    Then I click the compact search button
    When I type into the search box a correct Cardiff name
    And I press enter in the search field
    Then I expect to see the search result count
    And I expect to see the search count for Cardiff

@topic-page
Scenario: Error for incorrect location (search term)
    Given I visit the Cardiff Results R0 page
    Then I click the compact search button
    And a name of a location is in the search box but it's not correct
    And I press enter in the search field
    Then I expect to be shown an error message indicating that the location name could not be found

@topic-page
Scenario: Arriving on results page
    Given I visit the Cardiff Results R0 page
    Then I click the compact search button
    And I type into the search box a correct Cardiff name
    And I press enter in the search field
    And I click on first result
    Then I expect to be taken to the local news results page for cardiff
