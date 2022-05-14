class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.all
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_param)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
    
  end

  def destroy_many
    checked_data = params[:deletes].keys
    if Item.destroy(checked_data)
      redirect_to root_path
      return
    else
      render root_path
    end
  end

  private
  def item_param
    params.require(:item).permit(:name, :category_id, :quantity,:order_point, :unit, :location, :store, :remarks, :image)
  end


end
