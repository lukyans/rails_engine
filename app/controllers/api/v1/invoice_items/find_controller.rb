module Api
  module V1
    module InvoiceItems
      class FindController < ApplicationController
        def show
          render json: InvoiceItem.order(id: :asc).find_by(invoice_item_params)
        end

        def index
          render json: InvoiceItem.where(invoice_item_params)
        end

        private
        def invoice_item_params
          params.permit(:id, :item_id, :invoice_id, :unit_price, :quantity, :created_at, :updated_at)
        end
      end
    end
  end
end
