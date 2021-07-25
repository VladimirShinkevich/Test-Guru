class BadgesController < ApplicationController
   
  def index
    @badges = Badge.all
  end

  def achievements
    @user_badges = current_user.badges
  end
end
