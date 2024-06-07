class BadgeRules::BaseRule
    def initialize(test_passage, rule_value)
      @test_passage = test_passage
      @user = test_passage.user
      @test = test_passage.test
      @rule_value = rule_value
    end

    def satisfied?
      raise NotImplementedError
    end
  end
