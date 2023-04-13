require 'net/http'
require 'uri'
require 'json'
require 'dotenv'

module EdamomApi
  def self.get(query)
    url = URI("https://api.edamam.com/search?q=#{query}&app_id=#{ENV['APP_ID']}&app_key=#{ENV['APP_KEY']}")
    # res = Net::HTTP.get(uri)
    # JSON.parse(response)
    # puts 'test🍎'
    # puts res
  
    # uri = URI('https://themealdb.com/api/json/v1/1/search.php')
    # params = { :s => 'Arrabiata'}
    # params = {}
    # uri.query = URI.encode_www_form(params)

    # res = Net::HTTP.get_response(uri)
    # puts res.body if res.is_a?(Net::HTTPSuccess)





    # url = URI("https://themealdb.com/api/json/v1/1/search.php?s=Arrabiata")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    # request["Authorization"] = "Bearer #{access_token}" # if the API requires authentication

    response = http.request(request)

    # puts response.read_body 
    return response.read_body


  end
end


