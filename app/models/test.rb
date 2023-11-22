class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  def self.tests_by_category(category_name)
    joins(:category)
      .where(categories: { name: category_name })
      .order(title: :desc)
      .pluck(:title)
  end
end
