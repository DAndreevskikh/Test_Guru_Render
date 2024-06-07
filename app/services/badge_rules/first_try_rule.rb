class BadgeRules::FirstTryRule < BadgeRules::BaseRule
    def satisfied?
      test_id = @rule_value.to_i
      return false unless test_id == @test.id

      @user.test_passages.where(test_id: test_id).count == 1 && @test_passage.success?
    end
  end
