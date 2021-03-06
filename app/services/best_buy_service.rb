class BestBuyService

  def self.get_stores(zipcode)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,city,longName,postalCode,phone,distance&pageSize=25&apiKey=#{ENV['api_key']}")
    JSON.parse(response.body, symbolize_names: true)[:stores]
  end
end
