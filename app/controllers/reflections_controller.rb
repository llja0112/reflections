class ReflectionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @reflections = Reflection.where(privacy: 1)
  end

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
    commontator_thread_show(@reflection)
  end

  def edit
    @reflection = Reflection.find(reflection_id_params)
  end

  def update
    r = Reflection.find(reflection_id_params)
    r.title = reflection_params['title']
    r.story = reflection_params['story']
    r.save
    redirect_to reflection_path(r)
  end

  def privacy
    @reflection = Reflection.find(reflection_id_params)
  end

  def authorise
    r = Reflection.find(reflection_id_params)
    authorised_personals = JSON.parse authorised_personals_params
    redirect_to reflection_privacy_path(r) if authorised_personals.empty?
    authorised_personals.each do |personal|
      if r.user != personal['id'].to_i
        Privacy.create(reflection_id: reflection_id_params , authorised_personal_id: personal['id'].to_i)
      end
    end
    redirect_to reflection_privacy_path(r)
  end

  def update_privacy
    r = Reflection.find(reflection_id_params)
    r.privacy = reflection_privacy_params
    r.save
    redirect_to :back
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

  def reflection_privacy_params
    params.require(:privacy)
  end

  def authorised_personals_params
    params.require(:authorised_personals)
  end
end
