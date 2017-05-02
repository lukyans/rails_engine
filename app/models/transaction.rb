class Transaction < ApplicationRecord
  validates :invoice_id, presence: true
  validates :name, presence: true
  validates :credit_card_number, presence: true, uniquness: true
  validates :result, presence: true

  belongs_to :invoice
end
