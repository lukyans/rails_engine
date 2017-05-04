module Api
  module V1
    module Merchants
      class RevenueController < ApplicationController
        def show
          render json: {"revenue": price_format(Merchant.revenue(params[:merchant_id],params[:date]))}
        end
      end
    end
  end
end
