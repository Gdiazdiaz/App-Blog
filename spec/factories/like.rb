FactoryBot.define do
  factory :like do
    association :author, factory: :user
    association :post, factory: :post
  end
end
