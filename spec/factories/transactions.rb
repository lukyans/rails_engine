FactoryGirl.define do
  factory :transaction do
    invoice nil
    credit_card_number 1
    credit_card_expiration_date "2017-05-02 15:21:27"
    result "MyString"
    created_at "2017-05-02 15:21:27"
    updated_at "2017-05-02 15:21:27"
  end
end
