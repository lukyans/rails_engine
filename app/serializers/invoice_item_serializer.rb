class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :invoice_id, :quantity, :unit_price

  attribute :unit_price do
    sprintf "%.2f", (object.unit_price.to_f/100)
  end
end
