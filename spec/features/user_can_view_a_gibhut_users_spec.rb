require "rails_helper"

#feature "user can view other github users" do
#  include Capybara::DSL
#  before(:each) do
#    Capybara.app = ApiCurious::Application
#  end
#
#  VCR.use_cassette "omniauth_login" do
#    scenario "logging in" do
#      visit root_path
#      click_on "Sign in with Github"
#
#      click_on "Following"
#      expect(page).to have_link "junegunn"
#      expect(current_path).to eq following_path
#    end
#  end
#end
