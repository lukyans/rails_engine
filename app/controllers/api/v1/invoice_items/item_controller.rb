module Api
  module V1
    module InvoiceItems
      class ItemController < ApplicationController
        def show
          render json: InvoiceItem.find(params[:invoice_item_id]).item
        end
      end
    end
  end
end
