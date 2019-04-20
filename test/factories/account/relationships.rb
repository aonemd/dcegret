FactoryBot.define do
  factory :account_relationship, class: 'Account::Relationship' do
    followed factory: :account
    follower factory: :account
  end
end
