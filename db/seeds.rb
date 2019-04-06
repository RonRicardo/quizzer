# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(
  email: "myemail@gmail.com",
  password: "123456",
  username: 'Zelda'
)

user2 = User.create(
  email: "user@email.com",
  password: "password",
  username: 'Shiek'
)

question = Question.create(
  title: "How many hours are in a day?"
)

Answer.create(content: '24', correct: true, question_id: question.id)
Answer.create(content: '34', correct: false, question_id: question.id)
Answer.create(content: '744', correct: false, question_id: question.id)
Answer.create(content: '25', correct: false, question_id: question.id)
