FactoryGirl.define do
  factory :company do
    organization "Google"
    state "CO"
    city "Denver"
    zip_code "80124"
    hiring 1
    hire_count 5
    name "John"
    title "RoR Developer"
    email "john@example.com"
    status "uncontacted"
  end
end
