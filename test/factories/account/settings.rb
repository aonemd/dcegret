FactoryBot.define do
  factory :account_setting, class: 'Account::Setting' do
    private_profile { false }
    account { nil }
  end
end
