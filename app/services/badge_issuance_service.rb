class BadgeIssuanceService
  RULE_CLASSES = {
    category_complete: BadgeRules::CategoryCompleteRule,
    first_try: BadgeRules::FirstTryRule,
    level_complete: BadgeRules::LevelCompleteRule
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    return unless successful_test?

    Badge.all.each do |badge|
      rule_class = RULE_CLASSES[badge.rule.to_sym]
      reward(badge) if rule_class.new(@test_passage, badge.rule_value).satisfied?
    end

    @awarded_badge
  end

  private

  def reward(badge)
    @user.badges << badge unless @user.badges.include?(badge)
    @awarded_badge = badge
  end

  def successful_test?
    @test_passage.success?
  end
end
