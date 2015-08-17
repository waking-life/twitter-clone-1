require 'rails_helper'

RSpec.feature "SiteLayouts", type: :feature do
  it "sees layout links" do
    visit root_path
    expect(page).to have_content("Help")
  end

  it "can visit the signup page" do
    visit signup_path
    expect(page.title).to have_content "Sign up"
  end
end
