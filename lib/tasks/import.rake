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
         
    puts "creating merchant from row #{@count} with name #{merchant[:name]} "
  end
  
  

end
