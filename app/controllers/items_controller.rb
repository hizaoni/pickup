class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :category_select
  before_action :item_find, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order(id: 'DESC')
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
      redirect_to items
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path
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
    if category_param[:category_id] == '1'
      selected_category_items = Item.all
      render json: { selected_category_items: selected_category_items }
    else
      selected_category_items = Item.where(category_id: category_param[:category_id])
      unless selected_category_items == []
        select_item_quantity = selected_category_items[0].quantity + Stock.where(item_id: selected_category_items[0].id).sum(:quantity) - Ship.where(item_id: selected_category_items[0].id).sum(:quantity)
        quantity = {}
        quantity.store('quantity', select_item_quantity)

        render json: { selected_category_items: selected_category_items, quantity: quantity }
      else
        render json: { selected_category_items: selected_category_items }
      end
    end
  end

  def item_quantity
    select_item = Item.find_by(id: select_item_param[:item_id])
    select_item_quantity = select_item.quantity + Stock.where(item_id: select_item_param[:item_id]).sum(:quantity) - Ship.where(item_id: select_item_param[:item_id]).sum(:quantity)
    quantity = {}
    quantity.store('quantity', select_item_quantity)
    render json: { select_item: select_item, quantity: quantity }
  end

  def search_item
    search_category_items = Item.where(category_id: params[:category_id])
    category = Category.find(params[:category_id]).name

    quantity = []
    search_category_items.each do |item|
      select_item_quantity = item.quantity + Stock.where(item_id: item.id).sum(:quantity) - Ship.where(item_id: item.id).sum(:quantity)
      quantity.push(select_item_quantity)
    end
    render json: { search_category_items: search_category_items, quantity: quantity, category: category }
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
    if params.key?('stock')
      params.require(:stock).permit(:category_id)
    elsif params.key?('ship')
      params.require(:ship).permit(:category_id)
    end
  end

  def select_item_param
    if params.key?('stock')
      params.require(:stock).permit(:item_id)
    elsif params.key?('ship')
      params.require(:ship).permit(:item_id)
    end
  end
end
