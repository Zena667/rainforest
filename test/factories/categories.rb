# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "Lamp"
    description "A desk lamp perfect for the modern office."
    price_in_cents 10000
  end

  factory :user do
    name "Zena"
    email "zena@hotmail.com"
    password "password"
    password_confirmation "password"
  end
end