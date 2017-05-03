class Item < ApplicationRecord
  validates :name, :description, :unit_price, :created_at, :updated_at, :merchant, presence: true

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
end
