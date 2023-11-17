# Создание пользователей
user1 = User.create(name: 'Алексей')
user2 = User.create(name: 'Мария')

# Создание категорий
category = Category.create(name: 'Ruby')

# Создание тестов
test1 = Test.create(title: 'Основы Ruby', level: 1, category_id: category.id, author_id: user1.id)
test2 = Test.create(title: 'Продвинутый Ruby', level: 2, category_id: category.id, author_id: user1.id)

# Создание вопросов
question1 = Question.create(body: 'Что такое Ruby?', test_id: test1.id)
question2 = Question.create(body: 'Что такое массив в Ruby?', test_id: test1.id)

# Создание ответов
Answer.create(body: 'Язык программирования', correct: true, question_id: question1.id)
Answer.create(body: 'Браузер', correct: false, question_id: question1.id)
Answer.create(body: 'Список элементов, упорядоченных по индексу', correct: true, question_id: question2.id)
Answer.create(body: 'Тип данных для текста', correct: false, question_id: question2.id)
