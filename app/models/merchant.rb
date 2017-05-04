class Merchant < ApplicationRecord
  validates :name, presence: true

  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def self.revenue(id, date=nil)
    if date.nil?
      Merchant.find(id.to_i).invoices.joins(invoice_items: :transactions).merge(Transaction.successful).sum("quantity*unit_price")
    else
      Merchant.find(id.to_i).invoices.where('created_at' => date).joins(:invoice_items).sum("quantity*unit_price")
    end
  end

  def self.favorite_customer(id)
    Merchant.find(id.to_i).customers.joins(:transactions).merge(Transaction.successful).group("customers.id").order("count(Transactions.result)desc").take
  end
end
