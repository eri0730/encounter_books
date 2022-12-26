FactoryBot.define do
  factory :book do
    title {Faker::Book.title}
    author {Faker::Book.author}
    summary {Faker::Lorem.sentence}
    recommend {Faker::Lorem.sentence}
    association :user

    after(:build) do |book|
      book.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
