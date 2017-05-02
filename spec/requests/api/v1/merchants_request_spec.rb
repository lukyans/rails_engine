require 'rails_helper'

describe "Merchant API" do
  it "sends a list of merchants" do
    merchant1, merchant2, merchant3 = create_list(:merchant, 3)

    get "/api/v1/merchants"

    expect(response).to be_success

    merchants = JSON.parse(response.body)
 
    expect(merchants.count).to eq(3)
    expect(merchants[0]["id"]).to eq(merchant1.id)
    expect(merchants[0]["name"]).to eq(merchant1.name)

    expect(merchants[1]["id"]).to eq(merchant2.id)
    expect(merchants[1]["name"]).to eq(merchant2.name)

    expect(merchants[2]["id"]).to eq(merchant3.id)
    expect(merchants[2]["name"]).to eq(merchant3.name)  
  end  
end