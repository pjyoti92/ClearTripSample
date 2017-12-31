Feature: Feature is to validate the login

@Test1
Scenario: This is to validate login

Given I open the application login page
Then I wait for "3" seconds
Then I navigate to "Flight" page
Then I entered the "Pune" text into "Source" text-field
Then I entered the "Bangalore" text into "Destination" text-field
Then I wait for "5" seconds
Then I entered the "Sun, 31 Dec,2017" text into "Dept-Date" text-field
Then I selected "3" form "Adults" dropdown
Then I selected "2" form "Child" dropdown
Then I selected "1" form "Infant" dropdown
#Then I clicked on "More-Options" link
#Then I selected "Economy" form "Class" dropdown
Then I clicked on "Search-Flight" button
Then I wait for "5" seconds
Then I clicked on flight "1" in flight grid