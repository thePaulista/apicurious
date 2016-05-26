require 'rails_helper'

#feature "User logs in with Github" do
#  include Capybara::DSL
#  before(:each) do
#    Capybara.app = Apicurious::Application
#    stub_omniauth
#  end
#
#  scenario "successfully" do
#    user =  User.create!(name: "Horace")
#
#    visit root_path
#
#    ApplicationController.any_instance.stubs(:current_user).returns(user)
#
#    expect(page.status_code).to eq 200
#    click_link "Login with Github"
#    expect(page).to have_content("Horace")
#    expect(page).to have_content("Logout")
#  end
#
#  def stub_omniauth
#    OmniAuth.config.test_mode = true
#    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new( {
#      provider: "github",
#      uid: "13561812",
#      extra: {
#        raw_info: {
#          name: "Hedy",
#          nickname: "thePaulista",
#          avatar_url: "thepaulista.png",
#        }
#      },
#      credentials: {
#        token: ENV["OAUTH_TOKEN"]
#      }
#    })
#  end
#end
