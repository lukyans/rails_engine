class Invoice < ApplicationRecord
  validates :customer, :merchant, :status, :created_at, :updated_at, presence: true

  belongs_to :customer
  belongs_to :merchant
  has_many :transactions

  has_many :invoice_items
  has_many :items, through: :invoice_items
end
