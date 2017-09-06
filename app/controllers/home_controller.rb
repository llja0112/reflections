class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to user_path(current_user.id)
    end
  end

  def demo
  end

  def about
  end
end
