class UsersController < ApplicationController
  def json_to_send
    if current_user
      authorize current_user
      render json: {
        logged_in: true,
        user_id: current_user.id,
        projects: current_user.projects
      }
    else
      render json: {
        logged_in: false
      }
    end
  end
end
