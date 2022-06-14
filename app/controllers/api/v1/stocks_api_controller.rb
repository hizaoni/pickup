module Api
  module V1
    class StocksApiController < ApplicationController
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


      private

      def stock_param
        params.require(:stock).permit(:quantity, :item_id)
      end
    end
  end
end
