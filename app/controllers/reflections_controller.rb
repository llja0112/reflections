class ReflectionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @reflections = Reflection.where(privacy: 1)
    if user_signed_in?
      # @reflections += current_user.request_reflections
      @reflections += current_user.reflections
      @reflections += current_user.visible_reflections
      review_reflections = Reflection.includes(:reflection_reviews)
        .joins(:reflection_reviews)
        .where('reviews.reviewer_id = ?', current_user.id)
      @reflections += review_reflections
      @review_reflection_ids = review_reflections.map {|r| r.id}
    end
    @reflections = @reflections.uniq
    @reflections = @reflections.sort_by &:updated_at
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
    @reflection_reviews = Review.where(reflection_id: @reflection.id, status: 1)
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
    @personals_json = @reflection.authorised_personals.map { |personal| {'value': "#{personal.name}; #{personal.email}", 'id': "#{personal.id}"} }.to_json
  end

  def review
    @reflection = Reflection.find(reflection_id_params)
    @reviewers_json = @reflection.reviewers.map { |reviewer| {'value': "#{reviewer.name}; #{reviewer.email}", 'id': "#{reviewer.id}"} }.to_json
  end

  def authorise
    r = Reflection.find(reflection_id_params)
    authorised_personals = JSON.parse authorised_personals_params
    Privacy.where(reflection: r).delete_all
    if authorised_personals.empty?
      flash[:notice] = 'No users added for sharing!'
      redirect_to reflection_privacy_path(r)
      return
    end
    authorised_personals.each do |personal|
      if r.user != personal['id'].to_i
        Privacy.create(reflection_id: reflection_id_params , authorised_personal_id: personal['id'].to_i)
      end
    end
    flash[:notice] = 'Successfully shared reflections!'
    redirect_to reflection_privacy_path(r)
  end

  def submit_for_review
    r = Reflection.find(reflection_id_params)
    reviewers = JSON.parse reviewers_params
    reviewers_ids = reviewers.map { |personal| personal['id'].to_i }
    reviewers_remove = r.reviewers.reject { |reviewer| reviewers_ids.include?(reviewer.id) }
    reviewers_remove.each{ |personal| Review.where(reflection: r, reviewer: personal).delete_all } unless reviewers_remove.empty?
    if reviewers.empty?
      flash[:notice] = 'You have not submitted any reviewers!'
      redirect_to reflection_review_path(r)
      return
    end
    current_reviewers_ids = r.reviewers.map { |personal| personal.id }
    reviewers_create = reviewers.reject{ |personal| current_reviewers_ids.include?(personal['id'].to_i) }
    reviewers_create.each do |personal|
      if r.user != personal['id'].to_i
        Review.create(reflection_id: reflection_id_params , reviewer_id: personal['id'].to_i)
      end
    end
    flash[:notice] = 'Your reflections have been sent for review!'
    redirect_to reflection_review_path(r)
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

  def reviewers_params
    params.require(:reviewers)
  end
end
