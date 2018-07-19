require 'uri'
require 'net/http'
require 'json' 
require './lib/WeatherDataFetcher.rb'
require './lib/DataFormatter.rb'

puts "Введите название города:"
CityName = gets.chomp
uri = URI.parse('http://api.openweathermap.org/data/2.5/weather?q='+CityName+'&units=metric&lang=ru&APPID=b0280922209565629c0586af0b86af04')
JsonContext = WeatherDataFetcher.new(uri)
context = JsonContext.FetchData
if context
  Data = DataFormatter.new(context)
  Data.WriteInformation
end
