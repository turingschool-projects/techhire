FactoryGirl.define do
  factory :admin, class: User do
    name "admin"
    role 1
    email "admin@example.com"
    password "password"
  end

  factory :user, class: User do
    name "user"
    role 0
    email "admin@example.com"
    password "password"
  end

  factory :super_admin, class: User do
    name "super_admin"
    role 2
    email "admin@example.com"
    password "password"
  end
end
