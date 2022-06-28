class StocksController < ApplicationController
  before_action :authenticate_user!, only: :show
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

  def show
    @stocks = Stock.where(item_id: params[:id])
  end


  private

  def stock_param
    params.require(:stock).permit(:quantity, :item_id)
  end
end
