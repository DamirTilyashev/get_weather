require 'uri'
require 'net/http'
require 'json' 

class WeatherDataFetcher
	def initialize(uri)
		@uri=uri
	end

	def FetchData
		Net::HTTP.start(@uri.host, @uri.port) do |http|
			request = Net::HTTP::Get.new @uri
			response = http.request request
			context = JSON.parse(response.body)
			if context['message']=="city not found"
				puts "Введите корректное название"
			else
				return context
			end
		end
	end
end

class DataFormatter
	def initialize(context)
		@weather = context['weather']
		@main = context['main']
		@wind = context['wind']
	end

	def WriteInformation
		puts @weather[0]['description'].to_s
		puts "Температура по Цельсию: " + @main['temp'].to_s
		puts "Скорость ветра: " + @wind['speed'].to_s + "м/с"	
	end

end

puts "Введите название города:"
CityName = gets.chomp
uri = URI.parse('http://api.openweathermap.org/data/2.5/weather?q='+CityName+'&units=metric&lang=ru&APPID=b0280922209565629c0586af0b86af04')
JsonContext = WeatherDataFetcher.new(uri)
context = JsonContext.FetchData
if context
	Data = DataFormatter.new(context)
	Data.WriteInformation
end
