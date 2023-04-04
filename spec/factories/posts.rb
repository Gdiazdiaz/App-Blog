FactoryBot.define do
    factory :post do
        title { Faker::Quote }
        text { Faker::Quote }
        commentsCounter { Faker::Number.digit }
        likesCounter { Faker::Number.digit }
        association :author, factory: :user
    end
  end