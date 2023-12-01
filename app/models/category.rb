class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  scope :sorted, -> { order(name: :asc) }
end
