# This will guess the User class
FactoryGirl.define do
  factory :post, :class => Blogocalypse::Post do
    title        Faker::Lorem.sentence(5)
    body         Faker::Lorem.paragraph(2)
    published_at Time.now
    images       { build_list(:image, 2) }
  end
end
