require 'rails_helper'

describe "Customer API" do
  it "sends a list of customers" do
    customer1, customer2, customer3 = create_list(:customer, 3)

    get "/api/v1/customers"

    expect(response).to be_success

    customers = JSON.parse(response.body)
 
    expect(customers.count).to eq(3)
    expect(customers[0]["id"]).to eq(customer1.id)
    expect(customers[0]["first_name"]).to eq(customer1.first_name)
    expect(customers[0]["last_name"]).to eq(customer1.last_name)

    expect(customers[1]["id"]).to eq(customer2.id)
    expect(customers[1]["first_name"]).to eq(customer2.first_name)
    expect(customers[1]["last_name"]).to eq(customer2.last_name)

    expect(customers[2]["id"]).to eq(customer3.id)
    expect(customers[2]["first_name"]).to eq(customer3.first_name)
    expect(customers[2]["last_name"]).to eq(customer3.last_name)
  end

  it "can get one customer by its id" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
  end

  it "finds customer by id" do
   customer = create(:customer)

   get "/api/v1/customers/find?id=#{customer.id}"

   parsed_customer = JSON.parse(response.body)

   expect(response).to be_success
   expect(parsed_customer["id"]).to eq(customer.id)
   expect(parsed_customer["first_name"]).to eq(customer.first_name)
   expect(parsed_customer["last_name"]).to eq(customer.last_name)
   expect(parsed_customer).to_not have_key("created_at")
   expect(parsed_customer).to_not have_key("updated_at")
  end

  it "finds customer by first name" do
   customer = create(:customer)

   get "/api/v1/customers/find?name=#{customer.first_name}"

   parsed_customer = JSON.parse(response.body)

   expect(response).to be_success
   expect(parsed_customer["id"]).to eq(customer.id)
   expect(parsed_customer["first_name"]).to eq(customer.first_name)
   expect(parsed_customer["last_name"]).to eq(customer.last_name)
   expect(parsed_customer).to_not have_key("created_at")
   expect(parsed_customer).to_not have_key("updated_at")
  end


  it "finds customer by last name" do
   customer = create(:customer)

   get "/api/v1/customers/find?name=#{customer.last_name}"

   parsed_customer = JSON.parse(response.body)

   expect(response).to be_success
   expect(parsed_customer["id"]).to eq(customer.id)
   expect(parsed_customer["first_name"]).to eq(customer.first_name)
   expect(parsed_customer["last_name"]).to eq(customer.last_name)
   expect(parsed_customer).to_not have_key("created_at")
   expect(parsed_customer).to_not have_key("updated_at")
  end

  it "finds customer by created_at" do
   customer = create(:customer)

   get "/api/v1/customers/find?created_at=#{customer.created_at}"

   parsed_customer = JSON.parse(response.body)

   expect(response).to be_success
   expect(parsed_customer["id"]).to eq(customer.id)
   expect(parsed_customer["first_name"]).to eq(customer.first_name)
   expect(parsed_customer["last_name"]).to eq(customer.last_name)
   expect(parsed_customer).to_not have_key("created_at")
   expect(parsed_customer).to_not have_key("updated_at")
  end

  it "finds customer by updated_at" do
   customer = create(:customer)

   get "/api/v1/customers/find?updated_at=#{customer.updated_at}"

   parsed_customer = JSON.parse(response.body)
 
   expect(response).to be_success
   expect(parsed_customer["id"]).to eq(customer.id)
   expect(parsed_customer["first_name"]).to eq(customer.first_name)
   expect(parsed_customer["last_name"]).to eq(customer.last_name)
   expect(parsed_customer).to_not have_key("created_at")
   expect(parsed_customer).to_not have_key("updated_at")
  end

  it "finds all customer by id" do
    customer = create(:customer)

    get "/api/v1/customers/find_all?id=#{customer.id}"

    parsed_customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_customer.first["id"]).to eq(customer.id)
    expect(parsed_customer.first["first_name"]).to eq(customer.first_name)
    expect(parsed_customer.first["last_name"]).to eq(customer.last_name)
    expect(parsed_customer.first).to_not have_key("created_at")
    expect(parsed_customer.first).to_not have_key("updated_at")
  end

  it "finds all customers by first name" do
    customer1 = create(:customer, first_name: "John")
    customer2 = create(:customer, first_name: "John")

    get "/api/v1/customers/find_all?name=#{customer1.first_name}"

    parsed_customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_customer.first["id"]).to eq(customer1.id)
    expect(parsed_customer.first["first_name"]).to eq(customer1.first_name)
    expect(parsed_customer.first["last_name"]).to eq(customer1.last_name)
    expect(parsed_customer.first).to_not have_key("created_at")
    expect(parsed_customer.first).to_not have_key("updated_at")

    expect(parsed_customer.last["id"]).to eq(customer2.id)
    expect(parsed_customer.last["first_name"]).to eq(customer2.first_name)
    expect(parsed_customer.first["last_name"]).to eq(customer2.last_name)
    expect(parsed_customer.last).to_not have_key("created_at")
    expect(parsed_customer.last).to_not have_key("updated_at")
  end

  it "finds all customers by created_at" do
    customer1 = create(:customer, created_at: "2017-05-01 18:11:51")
    customer2 = create(:customer, created_at: "2017-05-01 18:11:51")

    get "/api/v1/customers/find_all?created_at=#{customer1.created_at}"

    parsed_customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_customer.first["id"]).to eq(customer1.id)
    expect(parsed_customer.first["first_name"]).to eq(customer1.first_name)
    expect(parsed_customer.first["last_name"]).to eq(customer1.last_name)
    expect(parsed_customer.first).to_not have_key("created_at")
    expect(parsed_customer.first).to_not have_key("updated_at")

    expect(parsed_customer.last["id"]).to eq(customer2.id)
    expect(parsed_customer.last["first_name"]).to eq(customer2.first_name)
    expect(parsed_customer.first["last_name"]).to eq(customer2.last_name)
    expect(parsed_customer.last).to_not have_key("created_at")
    expect(parsed_customer.last).to_not have_key("updated_at")
  end

  it "finds all customers by updated_at" do
    customer1 = create(:customer, updated_at: "2017-05-01 18:11:51")
    customer2 = create(:customer, updated_at: "2017-05-01 18:11:51")

    get "/api/v1/customers/find_all?updated_at=#{customer1.updated_at}"

    parsed_customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_customer.first["id"]).to eq(customer1.id)
    expect(parsed_customer.first["first_name"]).to eq(customer1.first_name)
    expect(parsed_customer.first["last_name"]).to eq(customer1.last_name)
    expect(parsed_customer.first).to_not have_key("created_at")
    expect(parsed_customer.first).to_not have_key("updated_at")

    expect(parsed_customer.last["id"]).to eq(customer2.id)
    expect(parsed_customer.last["first_name"]).to eq(customer2.first_name)
    expect(parsed_customer.first["last_name"]).to eq(customer2.last_name)
    expect(parsed_customer.last).to_not have_key("created_at")
    expect(parsed_customer.last).to_not have_key("updated_at")
  end

  it "finds random customer" do
    customer = create(:customer)

    get "/api/v1/customers/random"

    parsed_customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_customer["id"]).to eq(customer.id)
    expect(parsed_customer["first_name"]).to eq(customer.first_name)
    expect(parsed_customer["last_name"]).to eq(customer.last_name)
    expect(parsed_customer).to_not have_key("created_at")
    expect(parsed_customer).to_not have_key("updated_at")
  end
end
