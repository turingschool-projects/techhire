require 'rails_helper'
require 'spec_helper'

RSpec.describe CompaniesHelper, type: :helper do

  describe "states" do
    it "returns all the states" do
      states_list = State.all
      expect(helper.states).to eq(states_list)
    end
  end
end
