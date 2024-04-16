# Создание администратора
admin = Admin.create!(
  email: 'admin@example.com', 
  password: 'password', 
  password_confirmation: 'password', 
  name: 'Admin', 
  first_name: 'AdminFirstName', 
  last_name: 'AdminLastName', 
  confirmed_at: Time.now 
)

# Создание пользователей 
user1 = User.create!(
  email: 'alexey@example.com', 
  password: '123456', 
  password_confirmation: '123456', 
  name: 'Алексей', 
  first_name: 'Алексей', 
  last_name: 'Иванов', 
  confirmed_at: Time.now
)
user2 = User.create!(
  email: 'maria@example.com', 
  password: '123456', 
  password_confirmation: '123456', 
  name: 'Мария', 
  first_name: 'Мария', 
  last_name: 'Петрова', 
  confirmed_at: Time.now
)

# Создание категорий
category_ruby = Category.create!(name: 'Ruby')
category_js = Category.create!(name: 'JavaScript')

# Создание тестов с автором (администратором)
test_ruby = Test.create!(title: 'Основы Ruby', level: 1, category: category_ruby, author: admin)
test_js = Test.create!(title: 'Продвинутый JavaScript', level: 2, category: category_js, author: admin)

# Создание вопросов
question_ruby_1 = Question.create!(body: 'Что такое Ruby?', test: test_ruby)
question_js_1 = Question.create!(body: 'Что такое замыкание в JavaScript?', test: test_js)

# Создание ответов
Answer.create!(body: 'Язык программирования', correct: true, question: question_ruby_1)
Answer.create!(body: 'Веб-фреймворк', correct: false, question: question_ruby_1)
Answer.create!(body: 'Функция, которая запоминает своё лексическое окружение', correct: true, question: question_js_1)
Answer.create!(body: 'Тип данных для чисел', correct: false, question: question_js_1)

puts "Пользователи созданы: #{User.count}"
puts "Категории созданы: #{Category.count}"
puts "Тесты созданы: #{Test.count}"
puts "Вопросы созданы: #{Question.count}"
puts "Ответы созданы: #{Answer.count}"
