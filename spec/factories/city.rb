FactoryGirl.define do
  factory :denver, class: UsaCity do
    name "Denver"
    state_id 1
  end
  factory :boulder, class: UsaCity do
    name "Boulder"
    state_id 1
  end
  factory :fort_collins, class: UsaCity do
    name "Fort Collins"
    state_id 1
  end
end
