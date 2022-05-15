class StocksController < ApplicationController

  def new
    @items = Item.all
    @stock = Stock.new
  end

  def create
    binding.pry
  end

end
