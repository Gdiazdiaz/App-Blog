FactoryBot.define do
  factory :user do
    name { Faker::Name }
    photo { 'https://unsplash.com/photos/F_-0BxGuVvo' }
  end
end
