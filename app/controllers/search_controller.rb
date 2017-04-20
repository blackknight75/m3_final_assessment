class SearchController < ApplicationController

  def index
    @stores = Kaminari.paginate_array(Store.find_stores(params["q"])).page(params[:page]).per(10)
  end
end
