module Api
  module V1
    class StocksApiController < ApplicationController
      skip_before_action :verify_authenticity_token
      def new
        @items = Item.all
        @stock = Stock.new
      end

      def create
        Stock.create(stock_param)

      end


      private

      def stock_param
        params.require(:stocks_api).permit(:quantity, :item_id)
      end
    end
  end
end
