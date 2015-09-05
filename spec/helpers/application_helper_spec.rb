require "spec_helper"
require 'rails_helper'


RSpec.describe ApplicationHelper, type: :helper do
  describe "slugify" do
    it "makes single word string into a slug" do
      expect(helper.slugify("Home")).to eq("home")
    end

    it "makes a 2 word string into a slug" do
      expect(helper.slugify("TechHire Locations")).to eq("techhire_locations")
    end

    it "makes a string with 'and' in it into a slug" do
      expect(helper.slugify("Tools and Resources")).to eq("tools_resources")
    end
  end

  describe "glyph" do
    it "work for home" do
      expect(helper.glyph('Home')).to eq("home")
    end

    it "work for techhire locations" do
      expect(helper.glyph('TechHire Locations')).to eq("pushpin")
    end
    it "work for learn more" do
      expect(helper.glyph('Learn More')).to eq("education")
    end
    it "work for tools and resources" do
      expect(helper.glyph('Tools and Resources')).to eq("wrench")
    end
  end

  describe "Pages" do
    it "returns all Pages" do
      create(:home_page)
      create(:locations_page)
      create(:learn_page)
      expect(helper.pages.count).to eq (3)
    end
  end

  describe "Organization type" do
    it "returns all types" do
      list = [["Please select..."],
            "Employer",
            "Government",
            "Interested Individual",
            "Non-Profit/Private Organization",
            "Training Institution",
            "Other"]
      expect(helper.organization_type_helper).to eq(list)
    end
  end

  describe "City Helper" do
    it "returns list of all city names in state abbr" do
      create(:colorado)
      create(:denver)
      create(:boulder)
      create(:fort_collins)
      list = [["Please select..."], "Boulder", "Denver", "Fort Collins"]
      expect(helper.city_helper("CO")).to eq(list)
    end
  end

  describe "State Helper" do
    it "returns all state abbr" do
      create(:colorado)
      create(:vermont)
      create(:california)
      list = [["Please select..."], "CO", "VT", "CA"]
      expect(helper.state_helper).to eq(list)
    end
  end
end
