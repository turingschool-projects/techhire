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

  def javascript(*files)
    # require 'pry' ; binding.pry
    content_for(:head) { javascript_include_tag(*files) }
  end

  # def states
  #   {
  #    AL: 1,
  #    AK: 2,
  #    AZ: 3,
  #    AR: 4,
  #    CA: 5,
  #    CO: 6,
  #    CT: 7,
  #    DE: 8,
  #    DC: 9,
  #    FL: 10,
  #    GA: 11,
  #    HI: 12,
  #    ID: 13,
  #    IL: 14,
  #    IN: 15,
  #    IA: 16,
  #    KS: 17,
  #    KY: 18,
  #    LA: 19,
  #    ME: 20,
  #    MD: 21,
  #    MA: 22,
  #    MI: 23,
  #    MN: 24,
  #    MS: 25,
  #    MO: 26,
  #    MT: 27,
  #    NE: 28,
  #    NV: 29,
  #    NH: 30,
  #    NJ: 31,
  #    NM: 32,
  #    NY: 33,
  #    NC: 34,
  #    ND: 35,
  #    OH: 36,
  #    OK: 37,
  #    OR: 38,
  #    PA: 39,
  #    RI: 40,
  #    SC: 41,
  #    SD: 42,
  #    TN: 43,
  #    TX: 44,
  #    UT: 45,
  #    VT: 46,
  #    VA: 47,
  #    WA: 48,
  #    WV: 49,
  #    WI: 50,
  #    WY: 51
  #   }
  # end
end
