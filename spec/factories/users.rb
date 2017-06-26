FactoryGirl.define do
  factory :user do
    full_name             { Faker::Lorem.word }
    email                 { Faker::Internet.email }
    password              { 'much_secret_so_password' }
    password_confirmation { 'much_secret_so_password' }
    bio                   { Faker::Lorem.sentence }
  end
end
