class GithubsController < ApplicationController
  def show
    @commit = Commit.all(current_user)
  end
end
