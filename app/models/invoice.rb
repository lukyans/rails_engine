class Invoice < ApplicationRecord
  validates :customer, :merchant, :status, :created_at, :updated_at, presence: true

  belongs_to :customer
  belongs_to :merchant
end
