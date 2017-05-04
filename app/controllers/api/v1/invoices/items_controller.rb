module Api
  module V1
    module Invoices
      class ItemsController < ApplicationController
        def index
          render json: Invoice.find(params[:invoice_id]).items
        end
      end
    end
  end
end
