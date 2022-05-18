class StocksController < ApplicationController

  def new
    @items = Item.all
    @stock = Stock.new
  end

  def create

    @stock = Stock.new(stock_param)
    if @stock.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def category_choice
  #   select_items = Item.where(category_id: params[:category_id])
  #   binding.pry
  #   render json:{ select_items: select_items }
  # end

  private
  def stock_param
    params.require(:stock).permit(:quantity,:item_id)
  end





end

