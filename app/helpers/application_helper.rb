module ApplicationHelper
  def state_helper
    states = CS.states(:US)
    alphastates = states.keys.sort_by{|k| states[k]}
    return alphastates
  end

  def city_helper #(state)
    CS.cities(:CO, :us)
  end
end
