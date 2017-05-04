module Api
  module V1
    module Invoices
      class TransactionsController < ApplicationController
        def index
          render json: Invoice.find(params[:invoice_id]).transactions
        end
      end
    end
  end
end
