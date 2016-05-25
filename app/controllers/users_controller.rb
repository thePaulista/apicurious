class UsersController < ApplicationController
  def show
    @github_user = GithubService.new(current_user)
  end
end
