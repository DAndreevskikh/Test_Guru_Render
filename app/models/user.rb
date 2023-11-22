class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'

  def tests_by_level(level)
    Test.joins(:user_tests)
        .where(user_tests: { user_id: id }, level: level)
  end
end
