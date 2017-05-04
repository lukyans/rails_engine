module Api
  module V1
    module Merchants
      class MostRevenueController < ApplicationController
        def index
          render json: Merchant.most_revenue(params[:quantity])
        end
      end
    end
  end
end
