class UsersController < ApplicationController
  before_filter :find_user, only: :show

  def show
  end

  private

  def find_user
    user_id = params[:id]
    @user = User.find(user_id)
  end
end
