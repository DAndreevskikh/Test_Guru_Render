class BadgeRules::LevelCompleteRule < BadgeRules::BaseRule
    def satisfied?
      level = @rule_value.to_i
      return false unless level == @test.level

      level_tests = Test.where(level: level).pluck(:id)
      user_completed_tests = @user.test_passages.where(test_id: level_tests).select(&:success?).pluck(:test_id).uniq
      level_tests.sort == user_completed_tests.sort
    end
  end
