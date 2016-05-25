require 'rails_helper'

feature "User logs in with Github" do
  include Capybara::DSL
  before(:each) do
    Capybara.app = Apicurious::Application
    stub_omniauth
  end

  scenario "sees his github profile" do
    visit github_path
    visit root_path

    click_link "Login with Github"

    expect(page.status_code).to eq 200
    expect(current_path).to eq root_path
    expect(page).to have_content("Horace")
    expect(page).to have_content("Logout")
    expect(page).to have_content("followers")
    expect(page).to have_content("following")
    expect(page).to have_content("following")
    expect(page).to have_content("starred")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new( {
      provider: "github",
      uid: "1234",
      extra: {
        raw_info: {
          name: "Horace",
          nickname: "worace",
          avatar_rul: "worace.png",
        }
      },
      credentials: {
        token: "pizza",
        secret: "secretpizza"
      }
    })
  end
end
