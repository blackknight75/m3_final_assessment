class SearchController < ApplicationController

  def index
    @stores = Store.find_stores(params["q"])
  end
end
