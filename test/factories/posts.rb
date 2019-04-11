FactoryBot.define do
  factory :post do
    content { Faker::TvShows::Friends.quote }
  end
end
