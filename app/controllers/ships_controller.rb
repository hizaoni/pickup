class ShipsController < ApplicationController

  def index
    redirect_to new_ship_path
  end

  def new
    @items = Item.all
    @ship = Ship.new
  end

  def create
    quantity_check
    
  end

  # def category_choice
  #   select_items = Item.where(category_id: params[:category_id])
  #   binding.pry
  #   render json:{ select_items: select_items }
  # end

  private
  def ship_param
    params.require(:ship).permit(:quantity,:item_id)
  end

  def quantity_check
    @item = Item.find_by(id: ship_param[:item_id])
    @ships = Ship.where(item_id: ship_param[:item_id])
    @stock = Stock.where(item_id: ship_param[:item_id])
    @quantity = (@item.quantity + @stock.sum(:quantity)) - @ships.sum(:quantity)
    
    if ship_param[:quantity].to_i < @quantity
      @ship = Ship.new(ship_param)
      if @ship.save
        if @item.order_point > (@quantity - @ship.quantity)
          @users = User.all
          @message = "#{@ship.item.name}が発注点になりました。"
          @users.each do |user|
            ContactMailer.send_mail(user, @message).deliver_now
          end
          redirect_to root_path 
        else
          redirect_to root_path
        end
      else
        render :new
        return
      end
    else
      @ship = Ship.new
      flash.now[:alert] = '在庫数を超えています'
      render :new
    end
  end
end
