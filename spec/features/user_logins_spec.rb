require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do
  context "with invalid params" do
    it "rejects blank params" do
      visit login_path
      fill_in "Email", with: ""
      fill_in "Password", with: ""
      click_button "Log in"

      expect(current_path).to eq(login_path)
    end
  end

  context "with valid params" do
    let!(:user) { User.create(name: "Bob", email: "bob@email.com", password: "password", password_confirmation: "password") }

    it "successfully logs in" do
      visit login_path
      fill_in "Email", with: "bob@email.com"
      fill_in "Password", with: "password"
      click_button "Log in"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Bob")
    end

    it "can log out after login" do
      visit login_path
      fill_in "Email", with: "bob@email.com"
      fill_in "Password", with: "password"
      click_button "Log in"

      click_on "Account"
      click_on "Log out"

      expect(current_path).to eq(root_path)
    end
  end
end
