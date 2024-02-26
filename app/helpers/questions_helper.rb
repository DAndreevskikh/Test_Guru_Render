module QuestionsHelper
  def question_header(question)
    action = question.new_record? ? 'Создать новый вопрос для теста: ' : 'Редактировать вопрос по тесту: '
    "#{action} #{question.test.title}"
  end
end
