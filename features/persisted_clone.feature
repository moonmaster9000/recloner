Feature: Persisted Clone

  Scenario: Persisting a clone to the database
    Given there is a document in the database
    When I clone! that document
    Then a copy of the document should exist in memory
    And a copy of the document should also be persisted to the database
