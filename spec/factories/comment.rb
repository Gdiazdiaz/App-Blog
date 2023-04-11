FactoryBot.define do
  factory :comment do
    text { Faker::Quote }
    association :author, factory: :user
    association :post, factory: :post
  end
end
