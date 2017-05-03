module Api
  module V1
    module Items
      class RandomController < ApplicationController
        def show
          render json: Item.order("RANDOM()").first
        end
      end
    end
  end
end
