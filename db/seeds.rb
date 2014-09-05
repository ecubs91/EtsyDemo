# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
@a = User.create!(email: 'georgegundle@gmail.com', password: 'georgegundle', password_confirmation: 'georgegundle', :first_name => 'George', :last_name => 'Gundle', role: 'tutor')
#@a.role = tutor
@a.save
@b = User.create!(email: 'harrylee1230@gmail.com', password: 'hyunjin91', password_confirmation: 'hyunjin91', :first_name => 'Harry', :last_name => 'Lee',  role: 'student')

Mailboxer::Conversation.delete_all
@con = @a.send_message(@b, 'Hi This is an uppersixth from Wellington College...', 'X has requested tuition on Biology')
#@b.reply_to_conversation(@con, 'got the seeds', 'seeds')
@b.reply_to_all(@con, 'Hi Thanks for getting in touch....')
#@b.role = student
@b.save