class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
