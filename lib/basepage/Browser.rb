require 'selenium-webdriver'
require 'yaml'

class Browser

  def initialize(browser_name)
    @driver=start_browser(browser_name)
    @config=YAML.load_file("./config/TestData.yaml")
    @driver.manage().window().maximize()
    @driver.manage().timeouts.implicit_wait=@config["Timeout"]
  end
  
  def start_browser(broswer_name)
    case broswer_name
    when 'chrome'
      driver=Selenium::WebDriver.for(:chrome)
    when 'firefox'
      driver=Selenium::WebDriver.for(:firefox)
    when 'ie'
      driver=Selenium::WebDriver.for(:ie)  
    else
      driver=Selenium::WebDriver.for(:chrome)
    end
    return driver
  end
  
  def open_application()
    app_url=@config["Test_Url"]
    @driver.get(app_url)
    sleep 5
    HomePage.new(@driver)
  end
end