# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
                  {first_name: 'User1', last_name: 'UserTest1', email: 'user1@test.com', password: 'test',  password_confirmation: 'test'},
                  {first_name: 'User2', last_name: 'UserTest2', email: 'duser2@test.com', password: 'test',  password_confirmation: 'test'}
                  ])
admin = Admin.create(first_name: 'Admin', last_name: 'AdminTest', email: 'admin@test.com', password: 'test', password_confirmation: 'test')

Navigation.create([{ title: 'Dashboard', position: 1, permalink: '/admins', admin:true},
                   { title: 'Users', position: 2, permalink: '/users'},
                   { title: 'Teams', position: 2, permalink: '/teams', admin: true},
                   { title: 'Questionnaires', position: 3, permalink: '/questionnaires', admin:true}
                   ])
Questionnaire.create(title: 'Default', admin: admin)

Question.create([
                  { title: 'Work', max_rate: 5, description: 'How would you rate his work flow'},
                  { title: 'communication', max_rate: 5, description: 'How would you rate his friendliness'},
                  { title: 'competence', max_rate: 5, description: 'How would you rate his dependency on the others'},
                  { title: 'extra', max_rate: 2, description: 'Do you think he eat normal and healthy foods'}
                ])
Team.create(title: 'Default', admin: admin, users: users)