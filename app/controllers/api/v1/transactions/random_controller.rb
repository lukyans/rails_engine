module Api
  module V1
    module Transactions
      class RandomController < ApplicationController
        def show
           render json: Transaction.order("RANDOM()").first
        end
      end
    end
  end
end