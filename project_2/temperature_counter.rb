require 'net/http'
require 'json'

def temp_counter
  uri = URI('https://www.7timer.info/bin/astro.php?lon=30.361&lat=59.931&ac=0&unit=metric&output=json&tzshift=0')
  res = Net::HTTP.get(uri)
  series = JSON.parse(res)['dataseries']
  
  sum = series.map { |serie| serie['temp2m'] }.sum
  sum / series.length
end