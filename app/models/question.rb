class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :validate_number_of_answers

  private

  def validate_number_of_answers
    errors.add(:base, 'Number of answers should be between 1 and 4') if answers.count < 1 || answers.count > 4
  end
end
