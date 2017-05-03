module Api
  module V1
    module Transactions
      class FindController < ApplicationController
        def show
          render json: Transaction.find_by(transaction_params)
        end

        def index
          render json: Transaction.where(transaction_params)  
        end

        private
        def transaction_params
          params.permit(:id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at)  
        end
      end
    end
  end
end
    