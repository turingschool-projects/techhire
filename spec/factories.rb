FactoryGirl.define do

  factory :company do
    name "Bob"
    organization "Google"
    title "RoR Developer"
    state "Colorado"
    city "Denver"
    email "google@email.com"
    hiring 1
    hire_count 5
  end
end
