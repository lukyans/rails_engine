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

  it "can get one merchant by its id" do
      id = create(:merchant).id

      get "/api/v1/merchants/#{id}"

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant["id"]).to eq(id)
  end

  it "finds merchant by id" do
   merchant = create(:merchant)

   get "/api/v1/merchants/find?id=#{merchant.id}"

  parsed_merchant = JSON.parse(response.body)

   expect(response).to be_success
   expect(parsed_merchant["id"]).to eq(merchant.id)
   expect(parsed_merchant["name"]).to eq(merchant.name)
   expect(parsed_merchant).to_not have_key("created_at")
   expect(parsed_merchant).to_not have_key("updated_at")
  end

  it "finds merchant by name" do
   merchant = create(:merchant)

   get "/api/v1/merchants/find?name=#{merchant.name}"

  parsed_merchant = JSON.parse(response.body)

   expect(response).to be_success
   expect(parsed_merchant["id"]).to eq(merchant.id)
   expect(parsed_merchant["name"]).to eq(merchant.name)
   expect(parsed_merchant).to_not have_key("created_at")
   expect(parsed_merchant).to_not have_key("updated_at")
  end

  it "finds merchant by created_at" do
   merchant = create(:merchant)

   get "/api/v1/merchants/find?created_at=#{merchant.created_at}"

  parsed_merchant = JSON.parse(response.body)

   expect(response).to be_success
   expect(parsed_merchant["id"]).to eq(merchant.id)
   expect(parsed_merchant["name"]).to eq(merchant.name)
   expect(parsed_merchant).to_not have_key("created_at")
   expect(parsed_merchant).to_not have_key("updated_at")
  end

  it "finds merchant by updated_at" do
   merchant = create(:merchant)

   get "/api/v1/merchants/find?updated_at=#{merchant.updated_at}"

  parsed_merchant = JSON.parse(response.body)
  
   expect(response).to be_success
   expect(parsed_merchant["id"]).to eq(merchant.id)
   expect(parsed_merchant["name"]).to eq(merchant.name)
   expect(parsed_merchant).to_not have_key("created_at")
   expect(parsed_merchant).to_not have_key("updated_at")
  end

  it "finds all merchants by id" do
   merchant = create(:merchant)

   get "/api/v1/merchants/find_all?id=#{merchant.id}"

  parsed_merchant = JSON.parse(response.body)

   expect(response).to be_success
   expect(parsed_merchant.first["id"]).to eq(merchant.id)
   expect(parsed_merchant.first["name"]).to eq(merchant.name)
   expect(parsed_merchant.first).to_not have_key("created_at")
   expect(parsed_merchant.first).to_not have_key("updated_at")
  end

  it "finds all merchants by name" do
    merchant1 = create(:merchant, name: "John")
    merchant2 = create(:merchant, name: "John")

   get "/api/v1/merchants/find_all?name=#{merchant1.name}"

  parsed_merchant = JSON.parse(response.body)

   expect(response).to be_success
   expect(parsed_merchant.first["id"]).to eq(merchant1.id)
   expect(parsed_merchant.first["name"]).to eq(merchant1.name)
   expect(parsed_merchant.first).to_not have_key("created_at")
   expect(parsed_merchant.first).to_not have_key("updated_at")

   expect(parsed_merchant.last["id"]).to eq(merchant2.id)
   expect(parsed_merchant.last["name"]).to eq(merchant2.name)
   expect(parsed_merchant.last).to_not have_key("created_at")
   expect(parsed_merchant.last).to_not have_key("updated_at")
  end

  it "finds all merchants by created_at" do
    merchant1 = create(:merchant, created_at: "2017-05-01 18:11:51")
    merchant2 = create(:merchant, created_at: "2017-05-01 18:11:51")

   get "/api/v1/merchants/find_all?created_at=#{merchant1.created_at}"

  parsed_merchant = JSON.parse(response.body)

   expect(response).to be_success
   expect(parsed_merchant.first["id"]).to eq(merchant1.id)
   expect(parsed_merchant.first["name"]).to eq(merchant1.name)
   expect(parsed_merchant.first).to_not have_key("created_at")
   expect(parsed_merchant.first).to_not have_key("updated_at")

   expect(parsed_merchant.last["id"]).to eq(merchant2.id)
   expect(parsed_merchant.last["name"]).to eq(merchant2.name)
   expect(parsed_merchant.last).to_not have_key("created_at")
   expect(parsed_merchant.last).to_not have_key("updated_at")
  end

  it "finds all merchants by updated_at" do
    merchant1 = create(:merchant, updated_at: "2017-05-01 18:11:51")
    merchant2 = create(:merchant, updated_at: "2017-05-01 18:11:51")

   get "/api/v1/merchants/find_all?updated_at=#{merchant1.updated_at}"

  parsed_merchant = JSON.parse(response.body)

   expect(response).to be_success
   expect(parsed_merchant.first["id"]).to eq(merchant1.id)
   expect(parsed_merchant.first["name"]).to eq(merchant1.name)
   expect(parsed_merchant.first).to_not have_key("created_at")
   expect(parsed_merchant.first).to_not have_key("updated_at")

   expect(parsed_merchant.last["id"]).to eq(merchant2.id)
   expect(parsed_merchant.last["name"]).to eq(merchant2.name)
   expect(parsed_merchant.last).to_not have_key("created_at")
   expect(parsed_merchant.last).to_not have_key("updated_at")
  end

  it "finds random merchant" do
    merchant = create(:merchant)
    
   get "/api/v1/merchants/random"

  parsed_merchant = JSON.parse(response.body)

   expect(response).to be_success
   expect(parsed_merchant["id"]).to eq(merchant.id)
   expect(parsed_merchant["name"]).to eq(merchant.name)
   expect(parsed_merchant).to_not have_key("created_at")
   expect(parsed_merchant).to_not have_key("updated_at")
  end
end