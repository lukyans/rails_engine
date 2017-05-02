module Api
  module V1
    module Merchants
      class RandomController < ApplicationController
        def show
           render json: Merchant.order("RANDOM()").first
        end
      end
    end
  end
end