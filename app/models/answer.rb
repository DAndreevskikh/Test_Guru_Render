class Answer < ApplicationRecord
  belongs_to :question

  validate :validate_number_of_answers

  scope :correct, -> { where(correct: true) }

  private

  def validate_number_of_answers
    if question.answers.count >= 4
      errors.add(:question, 'cannot have more than 4 answers')
    end
  end
end
