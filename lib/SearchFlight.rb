class SearchFlight < Flight

  ROWS_FLIGHT={:xpath=>"(//nav[@class='listViewNav'])[3]//ul[@class='listView flights']//li[@class='listItem  nonBundled ' or @class='listItem showTabs nonBundled ']"}
  BUTTON={:xpath=>"//button[@type='submit']"}

  def initialize(driver)
    super
    @driver=driver
  end

  def select_book_of_row(row_number)
    row=row_number.to_i
#    options=@driver.find_elements(ROWS_FLIGHT)
#    options[row].click
   buttons=@driver.find_elements(BUTTON)
#    @base_page.click_element(buttons[row],"Book")
   buttons[row].click
    @base_page.wait_for_element_disappear(20)
   Itinerary1.new(@driver)
  end
end