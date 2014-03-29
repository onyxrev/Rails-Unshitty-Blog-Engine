# This will guess the User class
FactoryGirl.define do
  factory :post, :class => Blogocalypse::Post do
    title        { "#{Faker::Lorem.sentence(5)} #{SecureRandom.urlsafe_base64(nil, false)}" }
    body         Faker::Lorem.paragraph(2)
    published_at { Time.at((Date.parse("01-01-1994").to_time.to_f - Date.parse("01-01-2014").to_time.to_f)*rand + Date.parse("01-01-1994").to_time.to_f) }
    images       { build_list(:image, 2) }
    tag_list     { 3.times.map{ Faker::Lorem.sentence(1) } }
  end
end
