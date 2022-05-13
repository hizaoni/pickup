class ItemsController < ApplicationController

  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_param)
    if @item.save
      redirect_to root_path
    else
      render :new
    end

  end

  private
  def item_param
    params.require(:item).permit(:name, :category_id, :quantity,:order_point, :unit, :location, :store, :remarks, :image)
  end


end
