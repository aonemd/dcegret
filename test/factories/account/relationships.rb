FactoryBot.define do
  factory :account_relationship, class: 'Account::Relationship' do
    followed factory: :account_with_settings
    follower factory: :account_with_settings
  end
end
