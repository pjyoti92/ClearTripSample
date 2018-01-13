require 'selenium-webdriver'
require 'logger'
require 'yaml'

class BasePage
  
  SPINNER={:xpath=>"(//div[@class='progressTracker'])[1]"}
  
  def initialize(driver)
    @driver=driver
    @config=YAML.load_file("./config/TestData.yaml")
    @logger=Logger.new(STDOUT)
    @logger.level=Logger::DEBUG
  end
  
  #Verifying page title
  def verify_page(webelement,value1,value2)
    @logger.info("Verifying the page title")
    if @driver.find_element(webelement)
      puts value1
    else
      puts value2  
    end
  end
  
  #Clicking element
  def click_element(webelement,name)
    @logger.info("Finding element #{name}")
   element=@driver.find_element(webelement)
   @logger.info("Clicking element #{name}")
   element.click
  end
  
  #Enter the text
  def enter_text(webelement, text)
    @logger.info("Entering text into #{webelement}")
    element1=@driver.find_element webelement
    puts "Element 1 found"
    element1.clear
    puts "Element cleared"
    element1.send_keys(text)
  end
  
  #Navigating
  def navigate(webelement)
    @logger.info("Navigating to  #{webelement}")
    @driver.find_element(webelement).click
  end
  
  #Selecting the dropdown by value
  def select_item_by_value(webelement,value)
    option=Selenium::WebDriver::Support::Select.new(@driver.find_element(webelement))
    option.select_by(:value,value)
  end
  
  #Selecting the dropdown by index
  def select_item_by_index(webelement,index)
    option=Selenium::WebDriver::Support::Select.new(@driver.find_element(webelement))
    option.select_by(:index,index)
  end
  
  #Waiting for the spinner to disappear
  def wait_for_element_disappear(time)
    spinner=@driver.find_element(SPINNER)
    wait=Selenium::WebDriver::Wait.new(:timeout=>time)
    wait.until {
     !spinner.displayed?
    }
  end
  
  #Verfying the link is displayed and enabled
  def enabled(webelement)
    element=@driver.find_element(webelement)
    value=element.enabled? and element.enabled?
    return value 
  end
  
  #Verifying page is opened
  def verifyEqual(exp_val,act_val)
    assert_equal(exp_val, act_val,"Wrong value Expected #{exp_val} Actual #{act_val}")
  end
  
end