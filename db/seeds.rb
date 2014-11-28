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

navs = Navigation.create([{title: 'Home', position: 1, permalink: '/home/home', nav_enabled: 1},
                         { title: 'Users', position: 2, permalink: '/users/index', nav_enabled: 0},
                         { title: 'Questions', position: 3, permalink: '/questions/index', nav_enabled:0},
                         {title: 'New performance review', position: 4, permalink: '/performance_reviews/new', nav_enabled:0}
                         ])

global = Global.create(admin: true, total_number_of_question: 10)