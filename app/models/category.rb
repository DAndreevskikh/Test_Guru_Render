class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  default_scope { order(name: :asc) }
end
