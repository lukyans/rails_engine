module Api
  module V1
    module Merchants
      class RevenueController < ApplicationController
        def show
          if params[:merchant_id].nil?
            render json: {"total_revenue": price_format(Merchant.revenue(params[:merchant_id],params[:date]))}
          else
            render json: {"revenue": price_format(Merchant.revenue(params[:merchant_id],params[:date]))}
          end
        end
      end
    end
  end
end
