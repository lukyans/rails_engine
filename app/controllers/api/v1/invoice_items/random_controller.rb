module Api
  module V1
    module InvoiceItems
      class RandomController < ApplicationController
        def show
          render json: InvoiceItem.order("RANDOM()").first
        end
      end
    end
  end
end
