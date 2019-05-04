FactoryBot.define do
  factory :account do
    email { "#{Faker::Internet.user_name}@random.com" }
    username { Faker::Internet.user_name }
    password { "12345678" }
  end

  factory :account_with_settings, parent: :account do
    association :settings, factory: :account_setting
  end
end
