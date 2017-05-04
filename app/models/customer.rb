class Customer < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def self.favorite_merchant(id)
    Customer.find(id.to_i).merchants.joins(:transactions).merge(Transaction.successful).group("merchants.id").order("count(Transactions.result)desc").take
  end
end
