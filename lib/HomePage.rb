require_relative './../lib/basepage/BasePage'

class HomePage

  #Header Tabs
  FLIGHT_LNK={:xpath=>"(//li[@class='flightApp']//a[.='Flights'])[2]"}
  HOTEL_LNK={:xpath=>"//li[@class='hotelApp ']"}
  LOCAL_LNK={:xpath=>"//li[@class='localApp']"}
  TRAINS={:xpath=>"trainsApp"}
  FLIGHT_DEALS={:xpath=>"//li[@class='hideB2B']//a[@title='Top flight deals']"}
  MOBILE={:xpath=>"//li[@class='hideB2B']//a[@title='Cleartrip Mobile']"}
  MANAGE_TRIPS={:xpath=>"//li[@class='yourTrips hideB2B']"}

  def initialize(driver)
    @driver=driver
    @base_page=BasePage.new(driver)
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

end
