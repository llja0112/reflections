class ReflectionsController < ApplicationController
  before_action :authenticate_user!

  def add
    @new_reflection = Reflection.new
  end

  def new
    reflection = Reflection.create(
      title: reflection_params[:title],
      story: reflection_params[:story],
      user: current_user)
    flash[:notice] = 'Reflection successfully created!'
    redirect_to user_path(current_user)
  end

  def show
    @reflection = Reflection.find(reflection_id_params)
  end

  private
  def reflection_id_params
    params.require(:id)
  end

  def reflection_params
    params.require(:reflection).permit(
      :title,
      :story)
  end
end