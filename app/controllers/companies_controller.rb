class CompaniesController < ApplicationController
  layout "static_application", only: [:new, :create, :welcome, 
                                      :stage1, :stage2, :stage3, :finished]
  before_action :authorize_company!, only: [:show]

  def new
    @company = Company.new
    @registration = RegistrationPresenter.new
  end

  def show
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "Welcome #{@company.organization}"
      if params[:organization_type] == 'Employer'
        redirect_to stage1_path(@company), status: 302
      else
        redirect_to welcome_path
      end
    else
      flash[:error] = "Please try again!"
      @registration = RegistrationPresenter.new
      render :new
    end
  end

  def welcome
  end

  def stage1
    @company = Company.find(params[:id])
  end

  def stage2
    @company = Company.find(params[:id])
    @company.update(company_params)
  end

  def stage3
    @company = Company.find(params[:id])
    @company.update(company_params)
  end

  def finished
    @company = Company.find(params[:id])
    @company.update(company_params)
    redirect_to welcome_path
  end

  private

  def company_params
    cp = params.require(:company).permit(
      :name,
      :organization,
      :title,
      :state,
      :city,
      :zip_code,
      :email,
      :organization_type,
      :techhire_involvement,
      :interest_hiring,
      :interest_training,
      :interest_connecting,
      :interest_supporting,
      :interest_community,
      # employer fields:
      :sector,
      :phone,
      :location,
      :it_employees,
      :it_category,
      :it_category_frontend,
      :it_category_backend,
      :it_category_mobile,
      :it_category_data,
      :it_category_biz_intel,
      :it_category_pm,
      :it_category_qa,
      :it_category_sysadmin,
      :it_category_tech_support,
      :it_category_writer,
      :it_category_design,
      :it_category_is,
      :it_category_other,
      :it_category_other_description,
      :skills_needed,
      :job_locations,
      :it_openings,
      :languages_needed,
      :drug_testing,
      :good_credit,
      :criminal_record,
      :casual_dress,
      :sponsorship,
      :relocation,
      :internship,
      :participate_akron,
      :participate_louisville,
      :participate_philadelphia,
      :participate_albuquerque,
      :participate_lynchburg,
      :participate_pittsburgh,
      :participate_birmingham,
      :participate_me,
      :participate_portland,
      :participate_chattanooga,
      :participate_memphis,
      :participate_ri,
      :participate_cincinnati,
      :participate_minneapolis,
      :participate_rochester,
      :participate_co,
      :participate_nashville,
      :participate_saltlakecity,
      :participate_de,
      :participate_kearney,
      :participate_sanantonio,
      :participate_detroit,
      :participate_sanfrancisco,
      :participate_eastky,
      :participate_neworleans,
      :participate_sanjose,
      :participate_kansascity,
      :participate_newyork,
      :participate_stlouis,
      :participate_losangeles,
      :participate_oakland,
      :participate_other,
      :participate_other_description,
      :commit_internship_description,
      :commit_fulltime_description,
      :commit_written,
      :commit_phone,
      :commit_metrics,
      :commit_other,
      :commit_other_description,
      :signature,
      :plan_talent,
      :plan_posting,
      :plan_champion,
      :plan_business,
      :plan_metrics,
      :plan_other,
      :plan_other_description,
      :source_language,
      :source_relationships,
      :source_hiring,
      :source_other,
      :source_other_description,
      :attract_connect,
      :attract_leverage,
      :attract_customize,
      :attract_other,
      :attract_other_description,
      :evaluate_behavior,
      :evaluate_screening,
      :evaluate_other,
      :evaluate_other_description,
      :retain_onboard,
      :retain_mentor,
      :retain_manage,
      :retain_track,
      :retain_other,
      :retain_other_description,
    )
    if params[:company][:hiring] == "1"
      cp.merge(hiring: true, hire_count: params[:company][:hire_count].to_i)
    else
      cp
    end
  end
end
