module ApplicationHelper
  def state_helper
    alphastates = State.all.map { |state| state.abbr }
    return alphastates
  end

  def city_helper
    all_cities = UsaCity.all.map { |city| city.name }
    return all_cities
  end

  def save_states
    states = CS.states(:US)
    alphastateabbr = states.keys.sort_by{|k| states[k]}
    alphastateabbr.each do |state_abbr|
      State.create(
      abbr: state_abbr
      )
    end
  end

  def save_cities
    State.all.each do |state|
      state_cities = CS.cities(state.abbr, :US)
      state_cities.each do |city|
        UsaCity.create(
        state_id: state.id,
        name: city
        )
      end
    end
  end

end
