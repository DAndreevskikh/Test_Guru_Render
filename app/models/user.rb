class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins(:user_tests)
        .where(user_tests: { user_id: self.id }, level: level)
  end
end
