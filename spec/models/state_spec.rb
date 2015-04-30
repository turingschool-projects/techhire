require 'rails_helper'

RSpec.describe State, type: :model do
  let! (:state) {
    State.create(
    abbr: "CO",
    id: 14
    )
  }

  let! (:usa_city1) {
    UsaCity.create(
    name: "Denver",
    state_id: 14
    )
  }
  
  let! (:usa_city2) {
    UsaCity.create(
                   name: "Boulder",
               state_id: 14
                  )
  }

  it "responds to usa_cities" do
    expect(state.usa_cities.first.name).to eq("Boulder")
  end

  it "can have many cities" do
    state.usa_cities.create(name: "Golden", state_id: 14)
    expect(state.usa_cities.count).to eq(3)
    expect(state.usa_cities.first.state_id).to eq(state.id)
  end
end
