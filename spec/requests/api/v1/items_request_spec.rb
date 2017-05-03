require 'rails_helper'

describe "Item API" do
  it "sends a list of items" do
    merchant = create(:merchant_with_items)
    item1 = merchant.items.first
    item2 = merchant.items.last

    get "/api/v1/items"

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(2)

    expect(items[0]["id"]).to eq(item1.id)
    expect(items[0]["name"]).to eq(item1.name)
    expect(items[0]["description"]).to eq(item1.description)
    expect(items[0]["unit_price"]).to eq(item1.unit_price)
    expect(items[0]["merchant_id"]).to eq(item1.merchant_id)

    expect(items[1]["id"]).to eq(item2.id)
    expect(items[1]["name"]).to eq(item2.name)
    expect(items[1]["description"]).to eq(item2.description)
    expect(items[1]["unit_price"]).to eq(item2.unit_price)
    expect(items[1]["merchant_id"]).to eq(item2.merchant_id)
  end
end
