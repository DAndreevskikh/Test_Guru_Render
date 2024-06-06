class BadgeIssuanceService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    return unless successful_test?

    Badge.all.each do |badge|
      reward(badge) if send("#{badge.rule}?", badge)
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

  def category_complete?(badge)
    category_id = badge.rule_value.to_i
    return false unless category_id == @test.category_id

    category_tests = Test.where(category_id: category_id).pluck(:id)
    user_completed_tests = @user.test_passages.where(test_id: category_tests).select(&:success?).pluck(:test_id).uniq
    category_tests.sort == user_completed_tests.sort
  end

  def first_try?(badge)
    test_id = badge.rule_value.to_i
    return false unless test_id == @test.id

    @user.test_passages.where(test_id: test_id).count == 1 && successful_test?
  end

  def level_complete?(badge)
    level = badge.rule_value.to_i
    return false unless level == @test.level

    level_tests = Test.where(level: level).pluck(:id)
    user_completed_tests = @user.test_passages.where(test_id: level_tests).select(&:success?).pluck(:test_id).uniq
    level_tests.sort == user_completed_tests.sort
  end
end
