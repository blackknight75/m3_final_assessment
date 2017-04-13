class Store

  def initialize(params)
    binding.pry
  end

  def self.find_stores(zipcode)
    stores = BestBuyService.new.get_stores(zipcode)
    stores.map do |store|
      Store.new(store)
    end
  end
end
