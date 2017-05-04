module Api
  module V1
    module Merchants
      class ItemsController < ApplicationController
        def index
          render json: Merchant.find(params[:merchant_id]).items
        end
      end
    end
  end
end
