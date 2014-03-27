# This will guess the User class
FactoryGirl.define do
  factory :image, :class => Blogocalypse::Image do
    image_uid Faker::Lorem.sentence(1)
  end
end
