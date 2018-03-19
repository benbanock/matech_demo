class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def index
    @users = User.all
  end

  def profile
    @user=current_user
  end

end

