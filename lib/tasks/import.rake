require 'csv'
require 'database_cleaner'

task :import => [:environment] do
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean


  merchants = (CSV.open'db/csv/merchants.csv', headers: true, header_converters: :symbol)
  count = 1
  merchants.each do |merchant|
    count += 1
    Merchant.create!(name: merchant[:name],
                    created_at: merchant[:created_at],
                    updated_at: merchant[:updated_at]
                    )


    puts "Creating merchant from row #{@count} with name #{merchant[:name]}"
  end

  @count = 1
  items = (CSV.open'db/csv/items.csv', headers: true, header_converters: :symbol)
  items.each do |item|
    @count += 1
    Item.create!(name: item[:name],
                 description: item[:description],
                 unit_price: item[:unit_price],
                 merchant_id: item[:merchant_id],
                 created_at: item[:created_at],
                 updated_at: item[:updated_at]
                )

    puts "Creating item from row #{@count} with name #{item[:name]}"
  end

  customers = (CSV.open'db/csv/customers.csv', headers: true, header_converters: :symbol)
  count = 1
  customers.each do |customer|
    count +=1
    Customer.create!(first_name: customer[:first_name],
                    last_name: customer[:last_name],
                    created_at: customer[:created_at],
                    updated_at: customer[:updated_at]
                    )
    puts "Creating customer from row #{count} with name #{customer[:first_name]} "
  end

  invoices = (CSV.open'db/csv/invoices.csv', headers: true, header_converters: :symbol)
  count = 1

  invoices.each do |invoice|
    count += 1
    Invoice.create!(customer_id: invoice[:customer_id],
                    merchant_id: invoice[:merchant_id],
                    status: invoice[:status],
                    created_at: invoice[:created_at],
                    updated_at: invoice[:updated_at]
                    )

    puts "Creating invoice from row #{count}"
  end

  transactions = (CSV.open'db/csv/transactions.csv', headers: true, header_converters: :symbol)
  count = 1
  
  transactions.each do |transaction|
    count +=1
    Transaction.create!(invoice_id: transaction[:invoice_id],
                    credit_card_number: transaction[:credit_card_number],
                    credit_card_expiration_date: transaction[:credt_card_exipration_date],
                    result: transaction[:result],
                    created_at: transaction[:created_at],
                    updated_at: transaction[:updated_at]
                    )

    puts "creating transaction from row #{count} with result #{transaction[:result]} "
  end
  
  invoice_items = (CSV.open'db/csv/invoice_items.csv', headers: true, header_converters: :symbol)
  count = 1
  
  invoice_items.each do |invoice_item|
    count +=1
    InvoiceItem.create!(item_id: invoice_item[:item_id],
                        invoice_id: invoice_item[:invoice_id],
                        quantity: invoice_item[:quantity],
                        unit_price: invoice_item[:unit_price],  
                        created_at: invoice_item[:created_at],
                        updated_at: invoice_item[:updated_at]
                        )
    puts "creating invoice_item from row #{count} with result #{invoice_item[:quantity]} "
  end
end
