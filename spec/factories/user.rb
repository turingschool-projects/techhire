FactoryGirl.define do
  factory :user do
    name "admin"
    role 1
    email "admin@example.com"
    password "password"
  end
end
