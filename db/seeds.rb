# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


 questions = Question.create([
                                 { position: 1, summary: 'Work flow', max_rate: 5, question: 'How would you rate his work flow'},
                                 { position: 2, summary: 'Friendliness', max_rate: 5, question: 'How would you rate his friendliness'},
                                 { position: 3, summary: 'Dependent', max_rate: 5, question: 'How would you rate his dependency on the others'},
                                 { position: 4, summary: 'Eating', max_rate: 2, question: 'Do you think he eat normal and healthy foods'}
                             ])

users = User.create([
                        {first_name: 'Azizou', last_name: 'Ogbone', email: 'ogboneazizou@gmail.com'},
                        {first_name: 'Claude', last_name: 'Piessou', email: 'pcladius1@gmail.com'},
                        {first_name: 'Ayaovi', last_name: 'Djissenou', email: 'djays@gmail.com'}
                    ])

 preview1 = PerformanceReview.create(user_id: users.first.id, number_of_questions: 4, commented: 0)
 preview2 = PerformanceReview.create(user_id: users.last.id, number_of_questions: 4, commented: 0)

feedbacks = Feedback.create([
                                { question_id: Question.find_by(position: 1).id, performance_review_id: preview1.id, comment: 'He handles it pretty well', rating: 4 },
                                { question_id: Question.find_by(position: 2).id, performance_review_id: preview1.id, comment: 'Quite friendly, especially with ladies', rating: 4 },
                                { question_id: Question.find_by(position: 3).id, performance_review_id: preview1.id, comment: 'Not so dependent', rating: 2 },
                                { question_id: Question.find_by(position: 4).id, performance_review_id: preview1.id, comment: 'Too much snacks and junks food', rating: 2 },
                                { question_id: Question.find_by(position: 1).id, performance_review_id: preview2.id, comment: 'He appeared to be slow compare to the remaining team member', rating: 2 },
                                { question_id: Question.find_by(position: 2).id, performance_review_id: preview2.id, comment: 'Quite friendly and eager to help others', rating: 5 },
                            ])