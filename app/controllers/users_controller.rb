class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @user = User.find(user_id_params)
    @reflections = @user.reflections.order('created_at DESC')
  end

  def update
    user = User.find(user_id_params)
    user.first_name = user_name_params[:first_name]
    user.last_name = user_name_params[:last_name]
    user.save
    flash[:notice] = 'User name successfully updated!'
    redirect_to edit_user_registration_path
  end

  private

  def user_id_params
    params.require(:id)
  end

  def user_name_params
    params.require(:user).permit(
      :first_name,
      :last_name)
  end
end
