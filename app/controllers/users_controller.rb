class UsersController < ApplicationController
  def show
    @user = Github.new(current_user)
  end
end
