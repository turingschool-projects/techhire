module ApplicationHelper
  def state_helper
    alphastates = State.all.map { |state| state.abbr }
    return alphastates
  end
end
