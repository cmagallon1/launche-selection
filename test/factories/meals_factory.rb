require 'faker'
#include ActionDispatch::TestProcess

FactoryBot.define do 
  factory :meal do
    name { Faker::Food.unique.dish }
    image { fixture_file_upload("#{Rails.root}/test/fixtures/files/test.png", 'image/png') }
    user_id { User.all.pluck(:id).sample  }
  end
end
