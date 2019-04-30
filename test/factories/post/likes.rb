FactoryBot.define do
  factory :post_like, class: 'Post::Like' do
    post { nil }
    account { nil }
  end
end
