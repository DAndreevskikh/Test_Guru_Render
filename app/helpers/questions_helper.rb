module QuestionsHelper
  def question_header(question)
    action = question.new_record? ? 'Create New' : 'Edit'
    "#{action} #{question.test&.title || 'Test'} Question"
  end
end
