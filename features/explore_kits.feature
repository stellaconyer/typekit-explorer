Feature: Explore Typekit Kits
  Background:
    Given I run `ruby ../../lib/explore_typekit.rb` interactively
  Scenario: Starting and exiting the explorer
    Given I type "exit"
    Then the output should contain "Let's explore your kits!"
    And the output should contain "Shutting down"
    And the exit status should be 0
 Scenario: Getting help
    Given I type "help"
    And I type "exit"
    Then the output should contain "Commands:"
 Scenario: Invalid input
    Given I type "asdf"
    And I type "exit"
    Then the output should contain "asdf is an invalid command."
    And the output should contain "Commands:"
