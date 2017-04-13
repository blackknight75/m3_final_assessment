class Store
  attr_reader :store_id,
              :store_type,
              :city,
              :name,
              :phone,
              :distance,
              :zipcode

  def initialize(params)
    @store_id = params[:storeId]
    @store_type = params[:storeType]
    @city = params[:city]
    @name = params[:longName]
    @phone = params[:phone]
    @distance = params[:distance]
    @zipcode = params[:postalCode]
  end

  def self.find_stores(zipcode)
    stores = BestBuyService.get_stores(zipcode)
    stores.map do |store|
      Store.new(store)
    end
  end
end
