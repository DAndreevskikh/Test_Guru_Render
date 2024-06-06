class BadgesController < ApplicationController
  before_action :set_badge, only: :show
  before_action :set_badges, only: :index

  def index; end

  def show; end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def set_badges
    @badges = Badge.all
  end
end
