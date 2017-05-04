class ApplicationController < ActionController::API
  def price_format(price)
    sprintf "%.2f",(price.to_f/100)
  end
end
