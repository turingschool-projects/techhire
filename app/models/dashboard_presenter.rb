class DashboardPresenter
  def uncontacted_companies
    Company.where(status: "uncontacted").order(updated_at: :desc)
  end

  def contacted_companies
    Company.where(status: "contacted").order(updated_at: :desc)
  end

  def confirmed_companies
    Company.where(status: "confirmed").order(updated_at: :desc)
  end

  def dead_companies
    Company.where(status: "dead").order(updated_at: :desc)
  end
end
