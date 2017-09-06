class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @user = User.find(user_id_params)
    @reflections = @user.reflections.order('created_at DESC')
  end

  def update
  end

  private

  def user_id_params
    params.require(:id)
  end
end
