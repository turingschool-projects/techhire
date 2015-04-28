# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

desc 'This builds city/state dropdown'
task :populate_form do
  Rake::Task["states"].invoke
  Rake::Task["cities"].invoke
end

task states: :environment do
  states = CS.states(:US)
  alphastateabbr = states.keys.sort_by{|k| states[k]}
  alphastateabbr.each do |state_abbr|
    State.create(
    abbr: state_abbr
    )
  end
end

task cities: :environment do
  State.all.each do |state|
    state_cities = CS.cities(state.abbr, :US)
    state_cities.each do |city|
      UsaCity.create(
      state_id: state.id,
      name: city
      )
    end
  end
end
