Rails.application.routes.draw do
  root "dashboards#index"
  get "/auth/github", as: :github_login
  get "/auth/github/callback", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/user", to: "users#show", as: :user
  get "/followers", to: "githubs#followers", as: :followers
  get "/following", to: "githubs#following", as: :following
end
