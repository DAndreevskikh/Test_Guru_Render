class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests

  def self.tests_by_category(category_name)
    joins(:category)
      .where(categories: { name: category_name })
      .order(title: :desc)
      .pluck(:title)
  end
end
