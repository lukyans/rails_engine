module Api
  module V1
    module Items
      class InvoiceItemsController < ApplicationController
        def index
          render json: Item.find(params[:item_id]).invoice_items
        end
      end
    end
  end
end
