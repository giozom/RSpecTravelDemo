require 'rspec'
require 'selenium-webdriver'
require 'rubygems'

describe 'PHP Travel Demo' do

  before(:all) do

    # create webdriver driver
    # the @ sign is to be able to access the driver object within the test
    @driver = Selenium::WebDriver.for (:firefox)

    # navigate to php travel site
    @driver.navigate.to 'http://phptravels.net/login'
  end

  it 'should navigate to travel site and login' do

    # click on username and password
    userName = @driver.find_element :name => 'username'
    userName.send_keys("user@phptravels.com")

    userPassword = @driver.find_element :name => 'password'
    userPassword.send_keys("demouser")

    # click on login button
    loginButton = @driver.find_element :css => '.btn.btn-primary.btn-block.btn-lg.loginbtn'
    loginButton.click

    # print out page title
    puts "Page title is: #{@driver.title}"

  end

  after(:all) do
    # close browser
    @driver.quit
  end

end