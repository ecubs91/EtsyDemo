# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
@a = User.create!(email: 'lee@test.com', password: 'abcdefgh', password_confirmation: 'abcdefgh', :first_name => 'Harry', :last_name => 'Lee')
@a.save

@b = User.create!(email: 'harry@test.com', password: 'abcdefgh', password_confirmation: 'abcdefgh', :first_name => 'Josh', :last_name => 'Manson')
@b.save

Mailboxer::Conversation.delete_all
@con = @a.send_message(@b, 'Hi This is an uppersixth from Wellington College...', 'X has requested tuition on Biology')
#@b.reply_to_conversation(@con, 'body', 'subject')
@b.reply_to_all(@con, 'Hi Thanks for getting in touch....')
#@a.reply_to_conversation(@con, 'body', 'subject')
@a.reply_to_all(@con, 'I am thinking of preparing for my alevel exams with some help over the christmas break')


Enquiry.delete_all
@x = Enquiry.create!(subject: 'Biology', level: 'Alevel', location: 'oxford', user_id: 1)
@x.save
@y = Enquiry.create!(subject: 'Chemistry', level: 'IB', location: 'london', user_id: 2)
@y.save

TutorProfile.delete_all
@d = TutorProfile.create!(university: 'Oxford', degree_subject: 'Biochemistry', teaching_subject: 'biology', user_id: 1)
@d.save

