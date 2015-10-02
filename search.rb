require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'capybara-webkit'

Capybara.run_server = false
Capybara.current_driver = :webkit
Capybara.app_host = "http://vancouver.craigslist.ca/search/van/jjj"

module Spider
  class Google
    include Capybara::DSL

    def search
    visit('/')
    fill_in "q", :with => ARGV[0] || "I love Ruby!"
    click_button "Search"
    all("p.row a").each do |h3|
      a = h3.find("a")
      puts "#{a.text}  =>  #{a[:href]}"
    end
    end
  end
end

spider = Spider::Google.new
spider.search
