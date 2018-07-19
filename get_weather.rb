require 'uri'
require 'net/http'
require 'json' 
require './lib/WeatherDataFetcher.rb'
require './lib/DataFormatter.rb'
require 'yaml'

puts "Введите название города:"
CityName = gets.chomp
config = YAML.load_file('config.yml')
uri = URI.parse('http://api.openweathermap.org/data/2.5/weather?q='+CityName+'&units=metric&lang=ru&APPID='+config['token'])
JsonContext = WeatherDataFetcher.new(uri)
context = JsonContext.FetchData
if context
  Data = DataFormatter.new(context)
  Data.WriteInformation
end
