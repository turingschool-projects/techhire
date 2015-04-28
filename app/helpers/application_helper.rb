module ApplicationHelper
  def state_helper
    alphastates = State.all.map { |state| state.abbr }
    return alphastates.insert(0, ["Select a State"])
  end
end
