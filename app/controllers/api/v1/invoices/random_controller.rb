module Api
  module V1
    module Invoices
      class RandomController < ApplicationController
        def show
          render json: Invoice.order("RANDOM()").first
        end
      end
    end
  end
end
