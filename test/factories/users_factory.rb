require 'faker'

FactoryBot.define do 
  factory :user do
    name { Faker::Name.name }
    password { Faker::Lorem.word }
    email { Faker::Internet.email  }
  end
end
