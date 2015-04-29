module ApplicationHelper
  def state_helper
    alphastates = State.all.map(&:abbr)
    return alphastates.insert(0, ["Select a State"])
  end
end
