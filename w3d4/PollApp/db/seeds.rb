# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(name: "user1")
user2 = User.create(name: "user2")
user3 = User.create(name: "user3")
user4 = User.create(name: "user4")
user5 = User.create(name: "user5")

poll1 = Poll.create(title: "poll1" , author_id: 1)
poll2 = Poll.create(title: "poll2" , author_id: 2)

question1 = Question.create(text: "question1", poll_id: 1)
question2 = Question.create(text: "question2", poll_id: 1)
question3 = Question.create(text: "question3", poll_id: 2)
question4 = Question.create(text: "question4", poll_id: 2)
question5 = Question.create(text: "question5", poll_id: 2)

ac1 = AnswerChoice.create(answer: "A", question_id: 1)
ac2 = AnswerChoice.create(answer: "B", question_id: 1)
ac3 = AnswerChoice.create(answer: "C", question_id: 2)
ac4 = AnswerChoice.create(answer: "D", question_id: 2)
ac5 = AnswerChoice.create(answer: "E", question_id: 3)
ac6 = AnswerChoice.create(answer: "3", question_id: 3)
ac7 = AnswerChoice.create(answer: "asdf", question_id: 3)
ac8 = AnswerChoice.create(answer: "5qy3", question_id: 4)
ac9 = AnswerChoice.create(answer: "tgb45", question_id: 5)
ac10 = AnswerChoice.create(answer: "1234", question_id: 5)
ac11 = AnswerChoice.create(answer: "34h", question_id: 5)
ac12 = AnswerChoice.create(answer: "5", question_id: 1)
ac13 = AnswerChoice.create(answer: "5y6", question_id: 5)
