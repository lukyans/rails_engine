module Api
  module V1
    module Items
      class BestDayController < ApplicationController
        def show
          render json: Item.best_day(params[:item_id]), serializer: ::DateSerializer
        end
      end
    end
  end
end
