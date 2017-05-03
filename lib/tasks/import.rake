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
    puts "creating customer from row #{count} with name #{customer[:first_name]} "
  end

  transactions = (CSV.open'db/csv/transactions.csv', headers: true, header_converters: :symbol)
  count = 1
  
  transactions.each do |transaction|
    count +=1
    Transaction.create!(#invoice_id: transaction[:invoice_id],
                    credit_card_number: transaction[:credt_card_number],
                    credit_card_expiration_date: transaction[:credt_card_exipration_date],
                    result: transaction[:result],
                    created_at: transaction[:created_at],
                    updated_at: transaction[:updated_at]
                    )
    puts "creating transation from row #{count} with result #{transaction[:reult]} "
  end
  


end
