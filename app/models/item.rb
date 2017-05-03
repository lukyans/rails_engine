class Item < ApplicationRecord
  validates :name, :description, :unit_price, :created_at, :updated_at, :merchant, presence: true

  belongs_to :merchant
end
