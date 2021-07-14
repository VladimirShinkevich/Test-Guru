# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
                       { name: 'Vova', email: 'vova693625@mail.ru', password: '12345q' },
                       { name: 'Anna', email: 'anna21031991@mail.ru', password: '87985421g' },
                       { name: 'Sergey', email: 'sergey0512@mail.ru', password: 'wqd78925' }
                     ])

categories = Category.create!([
                                { title: 'Frontend' },
                                { title: 'Backend' },
                                { title: 'Mashine Learning' }
                              ])

tests = Test.create!([
                       { title: 'HTML', category: categories[0], author: users[0] },
                       { title: 'JavaScript', level: 1, category: categories[0], author: users[2] },
                       { title: 'Ruby', level: 2, category: categories[1], author: users[0] },
                       { title: 'Java', level: 3, category: categories[1], author: users[2] },
                       { title: 'Python', level: 2, category: categories[2], author: users[1] }
                     ])

questions = Question.create!([
                               { body: 'What is the <a> tag used for?', test: tests[0] },
                               { body: 'Choose the right statements for callbacks', test: tests[1] },
                               { body: 'How many messages will be printed to the console? for(var i = 10; i < 35; i += 5) { console.log(i); }',
                                 test: tests[1] },
                               { body: 'Select the method to get the whole inheritance chain for object',
                                 test: tests[2] },
                               { body: 'What does the following code return? p [1, 2, 3, 4, 5].reduce {|m, x| m * x }',
                                 test: tests[2] },
                               { body: 'Does Java support multiple inheritance?', test: tests[3] },
                               { body: 'How many arguments can lamda function take?', test: tests[4] }
                             ])

Answer.create!([
                 { body: 'To define header', question: questions[0] },
                 { body: 'To print text', question: questions[0] },
                 { body: 'To create links', correct: true, question: questions[0] },

                 { body: 'A callback is a function passed as an argument to another function', correct: true, question: questions[1] },
                 { body: 'Where callbacks really shine are in asynchronous functions, where one function has to wait for another function ', correct: true, questiond: questions[1] },
                 { body: "Javascript doesn't support callback functions", question: questions[1] },

                 { body: '5', question: questions[2] },
                 { body: '6', correct: true, question: questions[2] },
                 { body: '0', question: questions[2] },
                 { body: '7', question: questions[2] },

                 { body: '.class', question: questions[3] },
                 { body: '.superclass', question: questions[3] },
                 { body: '.ancestors ', correct: true, question: questions[3] },

                 { body: '15', question: questions[4] },
                 { body: '120', correct: true, question: questions[4] },
                 { body: '0', question: questions[4] },

                 { body: 'Yes', correct: true, question: questions[5] },
                 { body: 'No', question: questions[5] },

                 { body: 'Any number of arguments', correct: true, question: questions[6] },
                 { body: 'Only one argument', question: questions[6] },
                 { body: 'No arguments', question: questions[6] }
               ])

