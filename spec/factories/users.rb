FactoryBot.define do
    factory :user do
        name { Faker::Name }
        postsCounter { Faker::Number.digit }
    end
  end