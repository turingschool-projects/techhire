require 'rails_helper'

RSpec.describe UsaCity, type: :model do
  let (:city1) {
    UsaCity.create(
                   name: "Denver",
               state_id: 14
                  )
  }

  it "is associated to a state" do
    expect(city1).to respond_to(:state)
  end
end
