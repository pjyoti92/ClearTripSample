require_relative './../lib/basepage/BasePage'

class HomePage

  #Header Tabs
  FLIGHT_LNK={:xpath=>"(//li[@class='flightApp']//a[.='Flights'])[2]"}
  HOTEL_LNK={:xpath=>"//li[@class='hotelApp ']"}
  LOCAL_LNK={:xpath=>"//li[@class='localApp']"}
  TRAINS={:xpath=>"//li[@class='trainsApp']"}
  FLIGHT_DEALS={:xpath=>"//li[@class='hideB2B']//a[@title='Top flight deals']"}
  MOBILE={:xpath=>"//li[@class='hideB2B']//a[@title='Cleartrip Mobile']"}
  MANAGE_TRIPS={:xpath=>"//li[@class='yourTrips hideB2B']"}
  PAGE_TITLE={:xpath=>"//span[@title='Cleartrip ']"}
  CURRENCY={:xpath=>"//div[@id='userAccountNav']//li[@class='menuItem listMenuContainer currencyMenuContainer']"}
  SELECT_CURRENY={:xpath=>"//ul[@class='currencyCol']//li//a"}
  COUNTRY_DROPDWON={:xpath=>"//a[@class='listMenuLink countryLink']"}
  COUNTRY_LIST={:xpath=>"//form[@id='countryForm']"}
  USER_ACCOUNT_LINK={:xpath=>"//a[@id='userAccountLink']"}
  CANCELLATION={:xpath=>"//li[@class='quickToolsHead']//following-sibling::li[1]"}
  CHANGE_FLIGHT={:xpath=>"//li[@class='quickToolsHead']//following-sibling::li[2]"}
  CHECK_PNR={:xpath=>"//li[@class='quickToolsHead']//following-sibling::li[3]"}
  PRINT_TICKET={:xpath=>"//li[@class='quickToolsHead']//following-sibling::li[4]"}
  HOTEL={:xpath=>"//li[@class='quickToolsHead']//following-sibling::li[5]"}

  def initialize(driver)
    @driver=driver
    @base_page=BasePage.new(driver)
    @base_page.verify_page(PAGE_TITLE, "HOME PAGE IS OPENED", "HOME PAGE IS NOT OPEN")
  end

  def navigateTo(fieldname)
    case fieldname
    when 'Flight'
      @base_page.navigate(FLIGHT_LNK)
      Flight.new(@driver)
    when 'Hotels'
      @base_page.navigate(HOTEL_LNK)
      Hotels.new(@driver)
    when 'Local'
      @base_page.navigate(LOCAL_LNK)
      Local.new(@driver)
    when 'Trains'
      @base_page.navigate(TRAINS)
      Trains.new(@driver)
    when 'FlightDeals'
      @base_page.navigate(FLIGHT_DEALS)
      FlightDeals.new(@driver)
    when 'Mobile'
      @base_page.navigate(MOBILE)
      Mobile.new(@driver)
    when 'ManageTrips'
      @base_page.navigate(MANAGE_TRIPS)
      ManageTrips.new(@driver)
    end
  end

  def click(fieldname)
    case fieldname
    when 'CurrencySelector'
      @base_page.click_element(CURRENCY,fieldname)
      self
    when 'Country'
      @base_page.click_element(COUNTRY_DROPDWON,fieldname)
      self
    when 'UserAccount'
      @base_page.click_element(USER_ACCOUNT_LINK,fieldname)
      self
    end
  end

  def check_enabled(fieldname)
    case fieldname
    when 'Flights'
      @base_page.enabled(FLIGHT_LNK)
    when 'Hotels'
      @base_page.enabled(HOTEL_LNK)
    when 'Local'
      @base_page.enabled(LOCAL_LNK)
    when 'Trains'
      @base_page.enabled(TRAINS)
    when 'FlightDeals'
      @base_page.enabled(FLIGHT_DEALS)
    when 'Mobile'
      @base_page.enabled(MOBILE)
    when 'ManageTrips'
      @base_page.enabled(MANAGE_TRIPS)
    end
  end

  def verify_and_return_page(pagename)
    case pagename
    when "Home"
      @base_page.verify_page(PAGE_TITLE, "HOME_PAGE_OPENED", "Home page not open")
      self
    end
  end
  
  def is_selected(fieldname)
    case fieldname
    when 'Indian Rupee'
     act_val=get_selected_value(SELECT_CURRENY)
     @base_page.verifyEqual("Indian Rupee",act_val)
    end
  end
  
  def get_selected_value(fieldname)
    options=@driver.find_elements(fieldname)
    option.each do |i|
      test_class=i.attribute("class")
      if test_class=="current"
        return i.text
      else
        puts "Not in the list"  
      end
    end
  end
end
