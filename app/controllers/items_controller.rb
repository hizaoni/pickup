class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :category_select
  before_action :item_find, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_param)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def show
    @ships = Ship.where(item_id: params[:id])
    @stock = Stock.where(item_id: params[:id])
    @quantity = (@item.quantity + @stock.sum(:quantity)) - @ships.sum(:quantity)
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
    if params.key?('deletes')
      checked_data = params[:deletes].keys
      if Item.destroy(checked_data)
        redirect_to items_path, notice: '削除しました'
        nil
      else
        render items_path
      end
    else
      redirect_to items_path, notice: '削除する備品を選択してください'
      nil
    end
  end

  def category_select
    selected_category_items = Item.where(category_id: category_param[:category_id])

    render json: {selected_category_items: selected_category_items}
    
  end


  private

  def item_param
    params.require(:item).permit(:name, :category_id, :quantity, :order_point, :unit, :location, :store, :remarks, :image)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def delete_param
  end

  def category_param
    params.require(:stock).permit(:category_id)
  end
end
