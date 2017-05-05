module Api
  module V1
    module Merchants
      class CustomersWithPendingInvoicesController < ApplicationController
        def show
          render json: Merchant.customers_with_pending_invoices(params[:merchant_id])
        end
      end
    end
  end
end
