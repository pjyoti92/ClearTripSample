Feature: To validate the home page

@Test2 
Scenario: Home Page

Given I open the application login page
Then I wait for "3" seconds
Then I am on "Home" page
#Then I validated "Flights" is enabled
#Then I validated "Hotels" is enabled
#Then I validated "Local" is enabled
#Then I validated "Trains" is enabled
#Then I validated "FlightDeals" is enabled
#Then I validated "Mobile" is enabled
#Then I validated "ManageTrips" is enabled
Then I clicked on "CurrencySelector" link
#Then I validate "Indian Rupee" is selected
#Then I clicked on "Country" link 
#Then I validate "India" is selected
Then I clicked on "UserAccount" link 
Then I wait for "6" seconds