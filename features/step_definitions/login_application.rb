
Given /^I open the application login page$/ do 
  @stepDescription="I open the application login page";
  @logger.info("******DRIVER IS ON PAGE :*****")
  @homepage=@browser.open_application()
end

Then /^I wait for "(.*?)" seconds$/ do |fieldname|
  @stepDecription="I wait for #{fieldname} seconds"
  sleep fieldname.to_i
end

Then /^I navigate to "(.*?)" page$/ do |fieldname|
  @stepDescription="Then i navigate to #{fieldname} page"
  @current_page=@homepage.navigateTo(fieldname)
  @logger.info("******DRIVER IS ON PAGE :*****#{@current_page}")
end

Then /^I clicked on "(.*?)" button|tab|link$/ do |fieldname|
  @stepDecription="I clicked on #{fieldname} button|tab|link"
  @logger.info("******DRIVER IS ON PAGE :*****#{@current_page}")
  @current_page=@current_page.click(fieldname)
end

Then /^I entered the "(.*?)" text into "(.*?)" text-field$/ do |text,fieldname|
  @stepDescription="I entered the #{text} text into #{fieldname} text-field"
  @logger.info("******DRIVER IS ON PAGE :*****#{@current_page}")
  @current_page.send_text(fieldname,text)
end

Then /^I selected "(.*?)" from the calender$/ do |fieldname|
  @stepDescription="I selected #{fieldname} from the calender"
  @logger.info("******DRIVER IS ON PAGE :*****#{@current_page}")
  @current_page.select_date(fieldname)
end

Then /^I selected "(.*?)" form "(.*?)" dropdown$/ do |value, dropdown_type|
  @stepDescription="I selected #{value} form #{dropdown_type} dropdown"
  @logger.info("******DRIVER IS ON PAGE :*****#{@current_page}")
  @current_page.select_option(dropdown_type,value)
end

Then /^I clicked on flight "(.*?)" in flight grid$/ do |row_number|
  @stepDescription="I clicked on flight #{row_number} in flight grid"
  @logger.info("******DRIVER IS ON PAGE :*****#{@current_page}")
  @current_page=@current_page.select_book_of_row(row_number)
end