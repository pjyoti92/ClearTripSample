require 'selenium-webdriver'
require 'cucumber'
require 'require_all'
require 'test/unit/assertions'
require 'logger'

require_all 'lib'

#World Test::Unit::Assertions

Before do |scenario|
 @browser=Browser.new(ENV['DRIVER'])  
 @stepDescription=""
 @logger=Logger.new(STDOUT)
 @logger.level=Logger::DEBUG
 @screenshot_dir="./DebugReport/screenshots"
end

After do |scenario|
  if(scenario.failed)
    time=Time.now.strftime('%Y_%m_%d_%h_%m_%s')
   name_of_scenario=time+scenario.name
    file_name=File.expand_path(@screenshot_dir)+'/'+name_of_scenario+'.png'
      driver.save_screenshot file_name
  else
  end
end