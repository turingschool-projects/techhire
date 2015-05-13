module CompaniesHelper
  def states
    @states ||= State.all
  end
end
