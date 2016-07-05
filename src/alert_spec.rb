require 'rspec'
require 'selenium-webdriver'
require 'rubygems'


describe 'Testing Alerts' do

  before(:all) do

    # create webdriver driver
    # the @ sign is to be able to access the driver object within the test
    @driver = Selenium::WebDriver.for (:firefox)

    # navigate to php travel site
    @driver.navigate.to 'http://phptravels.net/login'
  end


  it 'should should verify alert msg is displayed' do

    # click on login button
    loginButton = @driver.find_element :css => '.btn.btn-primary.btn-block.btn-lg.loginbtn'
    loginButton.click

    # add a wait of 2secs for driver to be able to locate the xpath
    wait = Selenium::WebDriver::Wait.new(:timeout => 2)
    alertBox = wait.until {
      errorMsg = @driver.find_element(:xpath, 'html/body/div[5]/form/div/div[1]/div')
      errorMsg if errorMsg.displayed?
    }

    # show me the error message in the alertBox
    puts "Alert is : #{alertBox.text}"

  end

  after(:all) do
    # close browser
    @driver.quit
  end

end