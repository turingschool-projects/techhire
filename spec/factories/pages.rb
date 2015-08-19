FactoryGirl.define do
  factory :home_page, class: Page do
    name "Home"
    number_of_locations 5
    template "MyText"
  end
  factory :locations_page, class: Page do
    name "TechHire Locations"
    number_of_locations 3
    template "MyText"
  end
  factory :learn_page, class: Page do
    name "Learn More"
    number_of_locations 4
    template "MyText"
  end
  factory :tools_page, class: Page do
    name "Tools and Resources"
    number_of_locations 4
    template "MyText"
  end
end
