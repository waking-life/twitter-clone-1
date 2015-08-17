require 'rails_helper'

RSpec.feature "SiteLayouts", type: :feature do
  it "sees layout links" do
    visit root_path
    expect(page).to have_content("Help")
  end
end
