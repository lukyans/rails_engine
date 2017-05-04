module Api
  module V1
    module Invoices
      class MerchantController < ApplicationController
        def show
          render json: Invoice.find(params[:invoice_id]).merchant
        end
      end
    end
  end
end
