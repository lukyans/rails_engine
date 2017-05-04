module Api
  module V1
    module Customers
      class FavoriteMerchantController < ApplicationController
        def show
          render json: Customer.favorite_merchant(params[:customer_id])
        end
      end
    end
  end
end
