FactoryBot.define do
  factory :account_setting, class: 'Account::Setting' do
    private_profile { false }
    account
  end
end
