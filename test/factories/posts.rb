FactoryBot.define do
  factory :post do
    content { Faker::TvShows::Friends.quote[0..179] }
    account
  end
end
