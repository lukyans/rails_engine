require 'csv'
require 'database_cleaner'

task :import => [:environment] do
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean

  @count = 1

  merchants = (CSV.open'db/csv/merchants.csv', headers: true, header_converters: :symbol)
  merchants.each do |merchant|
    @count += 1
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

end
