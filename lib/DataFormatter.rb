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
