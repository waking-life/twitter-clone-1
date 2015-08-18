require 'rails_helper'

RSpec.feature "User can signup", type: :feature do
  it "doesn't signup with invalid params" do
    visit signup_path
    fill_in "Name", with: ""
    fill_in "Email", with: "user@invalid"
    fill_in "Name", with: "foo"
    fill_in "Name", with: "bar"
    click_on "Create my account"

    expect(page).to have_content "errors"
  end
end
