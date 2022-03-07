Feature: Square check
  As a user
  I want to check that four points in the space are a square

  Scenario Outline: The user inputs <coord1>, <coord2>, <coord3>, <coord4> and clicks the <button> button
    Given The user opens a square check page
    When the user inputs the <coord1> to coordinate one
    And the user inputs the <coord2> to coordinate two
    And the user inputs the <coord3> to coordinate three
    And the user inputs the <coord4> to coordinate four
    And the user clicks the <button> button.
    Then the user should be presented with a <message> message

  Examples: 
    | coord1 | coord2 | coord3 | coord4 | button | message
    # Check that it detects a square regardless of the order of the coordinates
    |  00,00 |  00,01 |  01,00 |  01,01 |  check | success
    |  00,01 |  01,01 |  00,00 |  01,00 |  check | success
    |  01,00 |  00,01 |  01,01 |  00,00 |  check | success
    |  01,01 |  01,00 |  00,01 |  00,00 |  check | success
    # Check that it detects a square with more variations of coordinates
    |  00,00 |  00,50 |  50,00 |  50,50 |  check | success
    |  00,00 |  00,99 |  99,00 |  99,99 |  check | success
    |  25,25 |  25,75 |  75,25 |  75,75 |  check | success
    |  98,98 |  98,99 |  99,98 |  99,99 |  check | success
    # Check that it does not detect a square
    |  00,00 |  00,00 |  00,00 |  00,00 |  check |   error
    |  50,50 |  50,50 |  50,50 |  50,50 |  check |   error
    |  99,99 |  99,99 |  99,99 |  99,99 |  check |   error
    |  00,00 |  25,25 |  50,50 |  99,99 |  check |   error
    |  33,42 |  76,12 |  56,90 |  80,16 |  check |   error
    # Send some coordinates in blank and validate a message of error is presented
    |        |  00,50 |  50,00 |  50,50 |  check |   error
    |  00,00 |        |  99,00 |  99,99 |  check |   error
    |  25,25 |  25,75 |        |  75,75 |  check |   error
    |  98,98 |  98,99 |  99,98 |        |  check |   error
    |        |        |  00,00 |  00,00 |  check |   error
    |  50,50 |  50,50 |        |        |  check |   error
    |  99,99 |        |        |        |  check |   error
    |        |        |        |  99,99 |  check |   error
    |        |        |        |        |  check |   error
    # Check that when pressing the clear button the fields are cleared but there is not a message shown
    |  00,00 |  00,50 |  50,00 |  50,50 |  clear |    none
    |  00,00 |  00,99 |  99,00 |  99,99 |  clear |    none
    |  25,25 |  25,75 |  75,25 |  75,75 |  clear |    none
    |  98,98 |  98,99 |  99,98 |  99,99 |  clear |    none
    
# Things I am missing about the acceptance criteria:
# - Which are the upper limits of the coordinates? Could we send a 320000,320000 coordinate?
# - Are negative coordinates accepted? (e.g: -25,-10)
# - Are decimal numbers supported? (e.g: 25.01,10.99)
# - What message is shown if the written coordinates are not supported?

# For what I did I assumed only positive numbers up to 2 digits. 
# Also inside the Then step I would check whether the clear button has been pressed to check all the forms are back to blank.
