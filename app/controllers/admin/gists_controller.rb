class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.all.includes(:user, :question)
  end
end
