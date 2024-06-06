class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, :rule, presence: true
  validates :rule_value, presence: true, if: :level_or_category_complete?
  validate :image_present

  BADGE_RULES = {
    'За успешное прохождение всех тестов из категории' => :category_complete,
    'За успешное прохождение теста с первой попытки' => :first_try,
    'За успешное прохождение всех тестов определённого уровня' => :level_complete
  }.freeze

  def self.images
    images_path = 'app/assets/images/badges/'
    badges = Dir.glob("#{images_path}*")
    badges.map { |badge_path| badge_path.gsub("#{images_path}", '') }
  end

  def level_or_category_complete?
    %i[level_complete category_complete].include?(rule.to_sym)
  end

  def dynamic_title
    case rule.to_sym
    when :category_complete
      "Все тесты из категории #{Category.find(rule_value).name}"
    when :first_try
      "Тест #{Test.find(rule_value).title} с первой попытки"
    when :level_complete
      "Все тесты уровня #{rule_value}"
    end
  end

  def display_image
    ActionController::Base.helpers.asset_path("badges/#{image}")
  end

  private

  def image_present
    errors.add(:image, 'необходимо указать изображение') unless image.present?
  end
end
