require 'rails_helper'

feature "User can see the login page" do
  scenario "successfully" do
    visit root_path

    #click_on "Login with Github"
    #here it is expecting [GET] "/login/auth/authorize"

    #expect(page).to have_content("Hello")
    #expect(page).to have_content("Logout")
  end
end
