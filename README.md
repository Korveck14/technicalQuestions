# Solutions to the technical questions of NovaFori

## Exercise 1 clarifications

Things I am missing about the acceptance criteria:
- Which are the upper limits of the coordinates? Could we send a 320000,320000 coordinate?
- Are negative coordinates accepted? (e.g: -25,-10)
- Are decimal numbers supported? (e.g: 25.01,10.99)
- What message is shown if the written coordinates are not supported?

For the proposed solution I assumed that only positive numbers up to 2 digits are accepted for the coordinates. Also, inside the Then step I would check whether the clear button has been pressed to check all the forms are back to blank.

Finally, in order to have more variants of the test cases I would play with for loops and randoms in order to generate coordinates of squares or not squares. Nevertheless, I don't think it was the point of the exercise since Gherkin does not allow that, or at least I'm not aware of.

## Exercise 2 clarifications

For the second exercise I used phyton as programming language in order to extract the needed information from a given website. Then, I used RobotFramework as a test framework in order to write the example tests.

