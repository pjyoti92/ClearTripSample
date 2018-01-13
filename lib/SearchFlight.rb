class SearchFlight < Flight

  ROWS_FLIGHT={:xpath=>"(//nav[@class='listViewNav'])[3]//ul[@class='listView flights']//li[@class='listItem  nonBundled ' or @class='listItem showTabs nonBundled ']"}
  BUTTON={:xpath=>"//button[@type='submit' and @class='booking']"}

  def initialize(driver)
    super
    @driver=driver
    sleep 2
  end

  def select_book_of_row(row_number)
   row=row_number.to_i
   buttons=@driver.find_elements(BUTTON)
   element=buttons[row-1]
   element.click
     Itinerary1.new(@driver)
  end
end