FactoryGirl.define do
  factory :merchant do
    sequence(:name) { |n| "name#{n}" }
     # created_at "2017-05-01 18:11:51"
    # updated_at "2017-05-01 18:11:51"
  end
end
