module Api
  module V1
    module Customers
      class RandomController < ApplicationController
        def show
           render json: Customer.order("RANDOM()").first
        end
      end
    end
  end
end