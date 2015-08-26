module ApplicationHelper
  def state_helper
    alphastates = State.all.map(&:abbr)
    return alphastates.insert(0, ["Please select..."])
  end

  def city_helper(state_abbr)
    state = State.find_by(abbr: state_abbr)
    cities = state.usa_cities.pluck(:name)
    return cities.insert(0, ["Please select..."])
  end


  def organization_type_helper
   types = ["Employer",
            "Training Institution",
            "Government",
            "Interested Individual",
            "Other"]

    return types.insert(0, ["Please select..."])
  end

  def pages
    Page.all
  end

  def nav_pages
    Page.nav_pages
  end

  def view_as_user_link(name)
    case_study_names = ['Capital One', 'Xpanxion', 'Rural Sourcing']
    if case_study_names.include? name
      get_case_study_link(name)
    else
      slugify(name)
    end
  end

  def slugify(name)
    if name.strip.scan(/\s/).empty?
      name.downcase
    else
      name.gsub("and", "").split(" ").join('_').downcase
    end
  end

  def glyph(name)
    case name
      when "Home"
        "home"
      when "TechHire Locations"
        "pushpin"
      when "Learn More"
        "education"
      when "Tools and Resources"
        "wrench"
    end
  end

  private

  def get_case_study_link(name)
    "case_studies/#{slugify(name)}"
  end
end
