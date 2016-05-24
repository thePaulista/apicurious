class UsersController < ApplicationController
  def show
    @user = OctocatService.find(current_user)
  end
end
