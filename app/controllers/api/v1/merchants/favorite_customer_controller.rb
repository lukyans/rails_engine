module Api
  module V1
    module Merchants
      class FavoriteCustomerController < ApplicationController
        def show
          render json: Merchant.favorite_customer(params[:merchant_id])
        end
      end
    end
  end
end
