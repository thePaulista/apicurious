class GithubsController < ApplicationController
  def followers
    @followers = GithubUser.new(current_user)
  end
end
