class BestBuyService

  def get_stores(zipcode)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,city,longName,phone,distance&apiKey=a8k7nnexb87aa9hb3zzqbgf7#{ENV['api_key']}")
    binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end
end
