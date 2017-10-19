class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
  end

  def show
    @user = User.find(user_id_params)
    if user_signed_in?
      @reflections = @user.reflections.order('updated_at DESC')
      @request_reflections = current_user.request_reflections.order('updated_at DESC')
      reflections_ids = @reflections.map{|reflection| reflection.id}
      @review_requests = Review.where(reflection_id: reflections_ids)
    else
      @reflections = @user.reflections.order('updated_at DESC').where(privacy: 1)
    end
  end

  def update
    user = User.find(user_id_params)
    user.name = user_name_params[:name]
    user.save
    flash[:notice] = 'User name successfully updated!'
    redirect_to edit_user_registration_path
  end

  def typeahead
    query = params[:query]
    search  = User.where('name LIKE :query OR email LIKE :query', query: "%#{query}%")
    results = search.map { |q| {'value': "#{q.name}; #{q.email}", 'id': "#{q.id}"} }.to_json

    render json: results
  end

  private

  def user_id_params
    params.require(:id)
  end

  def user_name_params
    params.require(:user).permit(
      :name)
  end
end
