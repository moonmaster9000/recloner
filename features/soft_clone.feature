Feature: Soft Clone

  Scenario: Cloning without persisting to the database
    Given there is a document in the database
    When I soft clone that document
    Then a copy of the document should exist in memory
    And there should only be a single document in the database
