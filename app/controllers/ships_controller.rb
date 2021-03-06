class ShipsController < ApplicationController
  def index
    redirect_to new_ship_path
  end

  def new
    @items = Item.all
    @ship = Ship.new
  end

  def destroy
    @ship = Ship.find(params[:id])
    @item = Item.find_by(id: @ship.item_id)
    @ship.destroy
    @ships = Stock.where(item_id: @ship.item_id)
    redirect_to items_path
  end

  def create
    quantity_check
  end

  def show
    @ships = Ship.where(item_id: params[:id])
    @item = Item.find(params[:id])
  end


  private


  def ship_param
    params.require(:ship).permit(:quantity, :item_id)
  end

  def quantity_check
    
      @item = Item.find_by(id: ship_param[:item_id])
      unless @item.nil?
        @ships = Ship.where(item_id: ship_param[:item_id])
        @stock = Stock.where(item_id: ship_param[:item_id])
        @quantity = (@item.quantity + @stock.sum(:quantity)) - @ships.sum(:quantity)

        if ship_param[:quantity].to_i <= @quantity
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
          end
        else
          @ship = Ship.new
          flash.now[:alert] = '在庫数を超えています'
          render :new
        end
      else
        @ship = Ship.new
        flash.now[:alert] = '備品を選択してください'
        render :new

      end
     
  end
end
