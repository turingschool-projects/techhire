class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :pages, :glyph, :slugify

  def after_sign_in_path_for(resource)
    if current_user && current_user.admin?
      admin_dashboard_index_path
    elsif current_user && current_user.company?
      company_path(current_user.company.id)
    else
      root_path
    end
  end

  def authorize!
    unless current_user && current_user.admin?
      redirect_to root_path
    end
  end

  def authorize_company!
    unless (current_user && (current_user.admin? || current_user.company.id.to_s == params[:id]))
      redirect_to root_path
    end
  end

  def pages
    Page.all
  end

  def slugify(name)
    case name
      when "Home"
        "home"
      when "TechHire Locations"
        "techhire_locations"
      when "Learn More"
        "learn_more"
      when "Tools and Resources"
        "tools_resources"
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
end
