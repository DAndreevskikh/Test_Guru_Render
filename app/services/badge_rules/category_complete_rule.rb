class BadgeRules::CategoryCompleteRule < BadgeRules::BaseRule
    def satisfied?
      category_id = @rule_value.to_i
      return false unless category_id == @test.category_id

      category_tests = Test.where(category_id: category_id).pluck(:id)
      user_completed_tests = @user.test_passages.where(test_id: category_tests).select(&:success?).pluck(:test_id).uniq
      category_tests.sort == user_completed_tests.sort
    end
  end
