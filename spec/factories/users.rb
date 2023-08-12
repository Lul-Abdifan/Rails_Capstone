# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { 'abdi' }
    email { 'abdi@gmail.com' }
    password { '1234567' }
    password_confirmation { '1234567' }
  end
end
