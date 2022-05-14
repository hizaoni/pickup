class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find, only: [:create, :show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    if @item.save
      redirect_to root_path
    else
      render :new
    end

  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_param)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
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

  def item_find
    @item = Item.find(params[:id])
  end


end
