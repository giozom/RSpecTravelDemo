require 'rspec'
require 'selenium-webdriver'
require 'rubygems'

describe 'Testing Menu Navigation Using Different Locators' do

  before(:all) do

    # create webdriver driver
    # the @ sign is to be able to access the driver object within the test
    @driver = Selenium::WebDriver.for (:firefox)

    # navigate to php travel site
    @driver.navigate.to 'http://phptravels.net/login'

  end

  xit 'should navigate through the different menus' do

    #Go to Hotels
    hotelsMenu = @driver.find_element :link => 'Hotels'
    hotelsMenu.click
    puts "Hotel page title is: #{@driver.title}"

    #Go to Tours
    toursMenu = @driver.find_element :xpath =>".//*[@id='top']/div[1]/div/div/div[2]/ul/li[3]/a"
    toursMenu.click
    puts "Tours page title is: #{@driver.title}"

    #Go to Flights
    flightsMenu = @driver.find_element :link => 'Flights'
    flightsMenu.click
    puts "Flights page title is: #{@driver.title}"

    #Go to Cars
    carsMenu = @driver.find_element :css => '[href="http://phptravels.net/cars"]'
    carsMenu.click
    puts "Cars page title is: #{@driver.title}"

    #Go to Offers
    offersMenu = @driver.find_element :link => 'Offers'
    offersMenu.click
    puts "Offers page title is: #{@driver.title}"

    #Go to Blog
    blogMenu = @driver.find_element :partial_link_text => 'Blo'
    blogMenu.click
    puts "Blog page title is: #{@driver.title}"

  end

  it 'should grab all the links on the page' do

    # find all elements by tag a
    elements = @driver.find_elements :css => 'li a'
    puts "Element on page: #{elements}"

    # look through all the list
    for i in elements
      puts "Value of x is #{i.text}"
    end

    # use a for..each loop
    elements.each do |item|
      puts 'For each value for item is '  + item.text

      if item.text == 'Home'
        next
        puts 'this should not print'
      end

      if item.text == 'Flights'
        puts 'Flights found successfully'
      end

      if item.text == 'Blog'
        break
      end

    end


  end

  after(:all) do

    # close browser
    @driver.quit

  end


end