require 'capybara/dsl'

url = "https://bit.ly/2r2AeyG"

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
Capybara.current_driver = :selenium

include Capybara::DSL

puts "started"
visit url
puts "visited"
# find('#ThrottleDropdown').find(:xpath, 'option[1]').select_option
puts "select box updated"
1600.times do |i|
  print "."
  puts("100 secs complete" + find(".well h3:nth-child(4)").text()) if i % 100 == 0
  sleep 1
end
