# Создание пользователей с email и паролем
user1 = User.create(name: 'Алексей', email: 'alexey@example.com', password: '123456', password_confirmation: '123456')
user2 = User.create(name: 'Мария', email: 'maria@example.com', password: '123456', password_confirmation: '123456')

# Создание категорий
category = Category.create(name: 'Ruby')

# Создание тестов с автором
test1 = Test.create(title: 'Основы Ruby', level: 1, category: category, author: user1)
test2 = Test.create(title: 'Продвинутый Ruby', level: 2, category: category, author: user1)

# Создание вопросов
question1 = Question.create(body: 'Что такое Ruby?', test: test1)
question2 = Question.create(body: 'Что такое массив в Ruby?', test: test1)

# Создание ответов
Answer.create(body: 'Язык программирования', correct: true, question: question1)
Answer.create(body: 'Браузер', correct: false, question: question1)
Answer.create(body: 'Список элементов, упорядоченных по индексу', correct: true, question: question2)
Answer.create(body: 'Тип данных для текста', correct: false, question: question2)
