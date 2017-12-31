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
  
  def click_element(webelement,name)
    @logger.info("Clicking element #{name}")
    @driver.find_element(webelement).click
  end
  
  def enter_text(webelement, text)
    @logger.info("Entering text into #{webelement}")
    element1=@driver.find_element webelement
    puts "Element 1 found"
    element1.clear
    puts "Element cleared"
    element1.send_keys(text)
  end
  
  def navigate(webelement)
    @logger.info("Navigating to  #{webelement}")
    @driver.find_element(webelement).click
  end
  
  def select_item_by_value(webelement,value)
    option=Selenium::WebDriver::Support::Select.new(@driver.find_element(webelement))
    option.select_by(:value,value)
  end
  
  def wait_for_element_disappear(time)
    spinner=@driver.find_element(SPINNER)
    wait=Selenium::WebDriver::Wait.new(:timeout=>time)
    wait.until {
     !spinner.displayed?
    }
  end
  
end