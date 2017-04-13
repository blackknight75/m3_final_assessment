class SearchController < ApplicationController

  def index
    binding.pry
    @stores = Store.find_stores(params["q"])
  end
end
