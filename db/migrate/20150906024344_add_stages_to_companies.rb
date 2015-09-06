class AddStagesToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, "it_employees", :string
    add_column :companies, "it_category_software", :boolean, :default => false
    add_column :companies, "it_category_frontend", :boolean, :default => false
    add_column :companies, "it_category_backend", :boolean, :default => false
    add_column :companies, "it_category_mobile", :boolean, :default => false
    add_column :companies, "it_category_data", :boolean, :default => false
    add_column :companies, "it_category_biz_intel", :boolean, :default => false
    add_column :companies, "it_category_pm", :boolean, :default => false
    add_column :companies, "it_category_qa", :boolean, :default => false
    add_column :companies, "it_category_sysadmin", :boolean, :default => false
    add_column :companies, "it_category_tech_support", :boolean, :default => false
    add_column :companies, "it_category_writer", :boolean, :default => false
    add_column :companies, "it_category_design", :boolean, :default => false
    add_column :companies, "it_category_is", :boolean, :default => false
    add_column :companies, "it_category_other", :boolean, :default => false
    add_column :companies, "it_category_other_description", :string
    add_column :companies, "skills_needed", :string
    add_column :companies, "job_locations", :string
    add_column :companies, "it_openings", :string
    add_column :companies, "languages_needed", :string
    add_column :companies, "drug_testing", :string
    add_column :companies, "good_credit", :string
    add_column :companies, "criminal_record", :string
    add_column :companies, "casual_dress", :string
    add_column :companies, "sponsorship", :string
    add_column :companies, "relocation", :string
    add_column :companies, "internship", :string
    add_column :companies, "participate_akron", :boolean, :default => false
    add_column :companies, "participate_louisville", :boolean, :default => false
    add_column :companies, "participate_philadelphia", :boolean, :default => false
    add_column :companies, "participate_albuquerque", :boolean, :default => false
    add_column :companies, "participate_lynchburg", :boolean, :default => false
    add_column :companies, "participate_pittsburgh", :boolean, :default => false
    add_column :companies, "participate_birmingham", :boolean, :default => false
    add_column :companies, "participate_me", :boolean, :default => false
    add_column :companies, "participate_portland", :boolean, :default => false
    add_column :companies, "participate_chattanooga", :boolean, :default => false
    add_column :companies, "participate_memphis", :boolean, :default => false
    add_column :companies, "participate_ri", :boolean, :default => false
    add_column :companies, "participate_cincinnati", :boolean, :default => false
    add_column :companies, "participate_minneapolis", :boolean, :default => false
    add_column :companies, "participate_rochester", :boolean, :default => false
    add_column :companies, "participate_co", :boolean, :default => false
    add_column :companies, "participate_nashville", :boolean, :default => false
    add_column :companies, "participate_saltlakecity", :boolean, :default => false
    add_column :companies, "participate_de", :boolean, :default => false
    add_column :companies, "participate_kearney", :boolean, :default => false
    add_column :companies, "participate_sanantonio", :boolean, :default => false
    add_column :companies, "participate_detroit", :boolean, :default => false
    add_column :companies, "participate_sanfrancisco", :boolean, :default => false
    add_column :companies, "participate_eastky", :boolean, :default => false
    add_column :companies, "participate_neworleans", :boolean, :default => false
    add_column :companies, "participate_sanjose", :boolean, :default => false
    add_column :companies, "participate_kansascity", :boolean, :default => false
    add_column :companies, "participate_newyork", :boolean, :default => false
    add_column :companies, "participate_stlouis", :boolean, :default => false
    add_column :companies, "participate_losangeles", :boolean, :default => false
    add_column :companies, "participate_oakland", :boolean, :default => false
    add_column :companies, "participate_other", :boolean, :default => false
    add_column :companies, "participate_other_description", :string
    add_column :companies, "commit_internship_description", :string
    add_column :companies, "commit_fulltime_description", :string
    add_column :companies, "commit_written", :string
    add_column :companies, "commit_phone", :string
    add_column :companies, "commit_metrics", :string
    add_column :companies, "commit_other", :string
    add_column :companies, "commit_other_description", :string
    add_column :companies, "signature", :string
    add_column :companies, "plan_talent", :string
    add_column :companies, "plan_posting", :string
    add_column :companies, "plan_champion", :string
    add_column :companies, "plan_business", :string
    add_column :companies, "plan_metrics", :string
    add_column :companies, "plan_other", :string
    add_column :companies, "plan_other_description", :string
    add_column :companies, "source_language", :string
    add_column :companies, "source_relationships", :string
    add_column :companies, "source_hiring", :string
    add_column :companies, "source_other", :string
    add_column :companies, "source_other_description", :string
    add_column :companies, "attract_connect", :string
    add_column :companies, "attract_leverage", :string
    add_column :companies, "attract_customize", :string
    add_column :companies, "attract_other", :string
    add_column :companies, "attract_other_description", :string
    add_column :companies, "evaluate_behavior", :string
    add_column :companies, "evaluate_screening", :string
    add_column :companies, "evaluate_other", :string
    add_column :companies, "evaluate_other_description", :string
    add_column :companies, "retain_onboard", :string
    add_column :companies, "retain_mentor", :string
    add_column :companies, "retain_manage", :string
    add_column :companies, "retain_track", :string
    add_column :companies, "retain_other", :string
    add_column :companies, "retain_other_description", :string
  end
end
