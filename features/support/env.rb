require 'selenium/webdriver'
require 'automate-cucumber'

url = "http://#{ENV['BROWSERSTACK_USER']}:#{ENV['BROWSERSTACK_ACCESSKEY']}@hub.browserstack.com/wd/hub"

capabilities = Selenium::WebDriver::Remote::Capabilities.new
capabilities[:project] = "Jenkins"
capabilities[:build] = "Ruby|Cucumber: #{ENV['BUILD_NUMBER']}"
capabilities[:os] = "Windows"
capabilities[:os_version] = "XP"
capabilities[:browser] = "chrome"

browser = Selenium::WebDriver.for(:remote, :url => url, :desired_capabilities => capabilities)

Before do |scenario|
  @browser = browser
end

at_exit do
  browser.quit
end
