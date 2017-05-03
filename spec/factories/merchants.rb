FactoryGirl.define do
  factory :merchant do
    sequence(:name) { |n| "name#{n}" }
    created_at "2017-05-01 18:11:51"
    updated_at "2017-05-01 18:11:51"

    factory :merchant_with_items do
      after(:create) do |merchant|
        create(:item, merchant: merchant)
        create(:item, merchant: merchant)
      end
    end
  end

  factory :item do
    sequence(:name) { |n| "name#{n}" }
    description "This is an item."
    unit_price 1000
    created_at "2017-05-02 15:55:15"
    updated_at "2017-05-02 15:55:15"
  end
end
