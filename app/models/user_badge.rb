class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge, optional: true

  def display_title
    badge&.dynamic_title
  end

  def display_image
    badge&.display_image
  end
end
