module Api
  module V1
    class ItemsController < ApplicationController
      def index
        render json: Item.all
      end
    end
  end
end
