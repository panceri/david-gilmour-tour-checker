require 'rubygems'
require 'mechanize'

agent = Mechanize.new
page = agent.get "http://www.davidgilmourtour.com/tour-dates.html"

row =  page.search('div.txt').search('table').search('tr[14]')
ret = row.search('td[1] span').map(&:text)[0].to_s + " | " + row.search('td[5]  span').map(&:text)[0].to_s +  " | " + row.search('td[7] span').map(&:text)[0].to_s + " | " + row.search('td[6] span').map(&:text)[0].to_s
if  row.search('td[5]  span').map(&:text)[0].to_s == "100%" and row.search('td[7] span').map(&:text)[3].to_s != "Soon"
  ret << " - Lets Rock!!!"
else
  ret << " - Waiting!!"
end

puts ret
