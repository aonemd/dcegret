FactoryBot.define do
  factory :account do
    email { "#{Faker::Internet.user_name}@random.com" }
    username { Faker::Internet.user_name }
    password_digest { "12345678" }
  end
end
