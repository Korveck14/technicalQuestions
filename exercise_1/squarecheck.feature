Feature: Square check
  As a user
  I want to check that four points in the space are a square

  Background:
    Given a user named "Default"
    And a new page of "Square check"

  Scenario Outline: The user inputs <coord1>, <coord2>, <coord3>, <coord4> and clicks the check button
    Given The user opens a square check page
    When the user inputs the <coord1> to coordinate one
    And the user inputs the <coord2> to coordinate two
    And the user inputs the <coord3> to coordinate three
    And the user inputs the <coord4> to coordinate four
    And the user clicks the check button
    Then the user should be presented with a <message> message

  Examples:
    | coord1 | coord2 | coord3 | coord4 | message
    # Check that it detects a square regardless of the order of the coordinates
    |  00,00 |  00,01 |  01,00 |  01,01 | success
    |  00,01 |  01,01 |  00,00 |  01,00 | success
    |  01,00 |  00,01 |  01,01 |  00,00 | success
    |  01,01 |  01,00 |  00,01 |  00,00 | success
    # Check that it detects a square with more variations of coordinates
    |  00,00 |  00,50 |  50,00 |  50,50 | success
    |  00,00 |  00,99 |  99,00 |  99,99 | success
    |  25,25 |  25,75 |  75,25 |  75,75 | success
    |  98,98 |  98,99 |  99,98 |  99,99 | success
    # Check that it does not detect a square
    |  00,00 |  00,00 |  00,00 |  00,00 |   error
    |  50,50 |  50,50 |  50,50 |  50,50 |   error
    |  99,99 |  99,99 |  99,99 |  99,99 |   error
    |  00,00 |  25,25 |  50,50 |  99,99 |   error
    |  33,42 |  76,12 |  56,90 |  80,16 |   error
    # Send some coordinates in blank and validate a message of error is presented
    |        |  00,50 |  50,00 |  50,50 |   error
    |  00,00 |        |  99,00 |  99,99 |   error
    |  25,25 |  25,75 |        |  75,75 |   error
    |  98,98 |  98,99 |  99,98 |        |   error
    |        |        |  00,00 |  00,00 |   error
    |  50,50 |  50,50 |        |        |   error
    |  99,99 |        |        |        |   error
    |        |        |        |  99,99 |   error
    |        |        |        |        |   error
    # Send some not accepted coordinates and validate a message of error is presented
    |  0000  |  00,50 |  50,00 |  50,50 |   error
    |  00,00 |  abdce |  99,00 |  99,99 |   error
    |  25,25 |  25,75 |  75,25 |     23 |   error
    |  98,98 |      ? |  99,98 |  99,99 |   error

  Scenario Outline: The user inputs <coord1>, <coord2>, <coord3>, <coord4> and clicks the clear button
    Given The user opens a square check page
    When the user inputs the <coord1> to coordinate one
    And the user inputs the <coord2> to coordinate two
    And the user inputs the <coord3> to coordinate three
    And the user inputs the <coord4> to coordinate four
    And the user clicks the clear button
    Then the user should be presented with a <message> message
    And all the forms are back to blank

    Examples:
    | coord1 | coord2 | coord3 | coord4 | message
    # Check that when pressing the clear button the fields are cleared but there is not a message shown
    |  00,00 |  00,50 |  50,00 |  50,50 |    none
    |  00,00 |  00,99 |  99,00 |  99,99 |    none
    |  25,25 |  25,75 |  75,25 |  75,75 |    none
    |  98,98 |  98,99 |  99,98 |  99,99 |    none
    |  0000  |  00,50 |  50,00 |  50,50 |    none
    |  00,00 |  abdce |  99,00 |  99,99 |    none
    |  25,25 |  25,75 |  75,25 |     23 |    none
    |  98,98 |      ? |  99,98 |  99,99 |    none
    |        |        |  00,00 |  00,00 |    none
    |  50,50 |  50,50 |        |        |    none

