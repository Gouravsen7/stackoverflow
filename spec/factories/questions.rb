FactoryBot.define do
  factory :question do
    description     { Faker::Lorem.question }
    user
  end
end