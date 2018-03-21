class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def index
    @users = User.all
  end

  def profile
    @user= current_user
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to profile_path
    authorize @user
  end

  private

  def use_params
    params.require(:user).permit(:company_name, :first_name, :description, :last_name, :email)
  end
end

