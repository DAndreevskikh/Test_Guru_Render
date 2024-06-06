class UserBadgesController < ApplicationController
  def index
    @user_badges = current_user.user_badges.includes(:badge).where.not(badge: nil)
  end
end
