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
