module ApplicationHelper
  def state_helper
    alphastates = State.all.map { |state| state.abbr }
    return alphastates
  end

  def city_helper
    all_cities = UsaCity.all.map { |city| city.name }
    return all_cities
  end
end
