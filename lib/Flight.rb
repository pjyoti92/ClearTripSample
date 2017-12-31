class Flight < HomePage

  ONE_WAY_RDBTN={:xpath=>"//input[@id='OneWay']"}
  ROUND_TRIP_RDBTN={:xpath=>"//input[@id='RoundTrip']"}
  MULTICITY_RDBTN={:xpath=>"//input[@id='MultiCity']"}
  FROM_TXT={:xpath=>"//input[@id='FromTag']"}
  TO_TXT={:xpath=>"//input[@id='ToTag']"}
  DATE_LINK={:xpath=>"//input[@id='DepartDate']"}
  CALENDER_NEXT_BTN={:xpath=>"//a[@class='nextMonth ']"}
  ADULT_TXT={:id=>"Adults"}
  CHILDRENS_TXT={:id=>"Childrens"}
  INFANTS_TXT={:id=>"Infants"}
  MORE_OPTIONS_LNK={:xpath=>"//a[@title='More search options']"}
  SEARCH_FLIGHTS={:id=>"SearchBtn"}
  CLASS={:id=>"Class"}
  PREFERED_AIRLINE={:xpath=>"//input[@id='AirlineAutocomplete']"}
    

  def initialize(driver)
    super
    @driver=driver
  end

  def click(fieldname)
    case fieldname
    when 'One-Way'
      @base_page.click_element(ONE_WAY_RDBTN,"#{fieldname}")
      self
    when 'Dept-Date'
      @base_page.click_element(DATE_LINK,"#{fieldname}")
      self
    when 'Search-Flight'
      @base_page.click_element(SEARCH_FLIGHTS,"#{fieldname}")
      SearchFlight.new(@driver)
    when 'More-Options'
      @base_page.click_element(MORE_OPTIONS_LNK,"#{fieldname}")  
      self
    else
      puts "#{fieldname} is not correct"  
    end
  end

  def send_text(fieldname,value)
    case fieldname
    when 'Source'
      @base_page.enter_text(FROM_TXT,value)
    when 'Destination'
      @base_page.enter_text(TO_TXT,value)
    when 'Dept-Date'
      @base_page.click_element(DATE_LINK,"#{fieldname}")
      if(value=='today-date')
        date=Time.new().strftime("%a,%d %b,%Y")
        @base_page.enter_text(DATE_LINK,date)
        sleep 10
      else
        @base_page.enter_text(DATE_LINK,value)
      end
    when 'City'
      @base_page.enter_text(CITY,value)
    when 'Prefered-Airline'
      @base_page.enter_text(PREFERED_AIRLINE,value)  
    end
  end

  def select_option(fieldname,value)
    case fieldname
    when 'Adults'
      @base_page.select_item_by_value(ADULT_TXT,value)
    when 'Child'
      @base_page.select_item_by_value(CHILDRENS_TXT,value)
    when 'Infant'
      @base_page.select_item_by_value(INFANTS_TXT,value)
    when 'Class'
      @base_page.select_item_by_value(CLASS,value)  
    end
  end

  def select_date(fieldname)
    options=fieldname.split("-")
    exp_year=options[2]
    exp_month=options[1]
    exp_date=options[0]
    current_month=@driver.find_element(:xpath=>"(//div[@class='title']//span[@class='ui-datepicker-month'])[1]")
    current_month2=@driver.find_element(:xpath=>"(//div[@class='title']//span[@class='ui-datepicker-month'])[2]")
    if(current_month==exp_month)
      puts "Expected month selected in the first calender"
    elsif(current_month2==exp_month)
      puts "Expected month selected in the second calender"
    else
      for i in 0..12
        @driver.find_element(CALENDER_NEXT_BTN).click
        if(current_month2==exp_month)
          puts "Expected month selected in the second calender"
          break;
        else
          puts "Date not available"
        end
      end
      options=@driver.find_elements(:xpath=>"//s")
      options.each do |i|
        if i.text == "#{exp_day}"
          i.click
          sleep 2
          puts "correct date selected"
          break
        else
          puts "Date not available"
        end
      end
    end
  end
end