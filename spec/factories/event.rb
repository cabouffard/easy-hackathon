FactoryGirl.define do
  factory :event do
    title { Faker::Name.title }
    description { Faker::Lorem::paragraph }
    date { DateTime.current }
    duration { '12h' }
    image { Faker::Avatar.image }
    introduction { Faker::Lorem.paragraphs.join('\n') }
  end
end
