Feature: Feature is to validate the login

@Test1 
Scenario: This is to validate login

Given I open the application login page
Then I wait for "3" seconds
Then I navigate to "Flight" page
Then I entered the "Pune" text into "Source" text-field
Then I entered the "Bangalore" text into "Destination" text-field
Then I wait for "5" seconds
Then I entered the "Wed, 10 Jan,2018" text into "Dept-Date" text-field
Then I selected "1" form "Adults" dropdown
Then I selected "1" form "Child" dropdown
Then I selected "1" form "Infant" dropdown
Then I clicked on "Search-Flight" button
Then I wait for "5" seconds
Then I clicked on flight "1" in flight grid
Then I clicked on "Insurance" button
Then I clicked on "Continue-It1" button
Then I wait for "2" seconds
Then I entered the "abc@gmail.com" text into "email" text-field
Then I clicked on "Continue-It2" button
Then I wait for "6" seconds

#Traveller - Details 
Then I selected "Mr" form "Adult-Title" dropdown
Then I entered the "Test Name" text into "Adult-FirstName" text-field
Then I entered the "Last" text into "Adult-LastName" text-field

Then I selected "Miss" form "Child-Title" dropdown
Then I entered the "Test Name1" text into "Child-FirstName" text-field
Then I entered the "Last1" text into "Child-LastName" text-field
Then I selected "1" form "Child-DOB-Day" dropdown
Then I selected "4" form "Child-DOB-Month" dropdown
Then I selected "2006" form "Child-DOB-Year" dropdown

Then I selected "Miss" form "Infant-Title" dropdown
Then I entered the "Test Name2" text into "Infant-FirstName" text-field
Then I entered the "Last2" text into "Infant-LastName" text-field
Then I selected "1" form "Infant-DOB-Day" dropdown
Then I selected "4" form "Infant-DOB-Month" dropdown
Then I selected "2016" form "Infant-DOB-Year" dropdown
Then I entered the "7894568745" text into "Mobile-Number" text-field
Then I clicked on "Continue-It3" button
Then I wait for "15" seconds

#Payment
Then I clicked on "Credit-Card" button
Then I entered the "54785263678944125" text into "Card-Number" text-field
Then I selected "09" form "CardExpiryMonth" dropdown
Then I selected "2018" form "CardExpiryYear" dropdown
Then I entered the "Jyoti" text into "Card-Name" text-field
Then I entered the "547" text into "Card-CVV" text-field
Then I clicked on "MakePaymentBtn" button

