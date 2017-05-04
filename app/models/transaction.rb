class Transaction < ApplicationRecord
  validates :invoice_id, presence: true
  # validates :credit_card_number, presence: true
  validates :result, presence: true

  belongs_to :invoice
  has_one :customer, through: :invoice
  has_one :merchant, through: :invoice

  scope :successful, -> { where result: "success" }
end
