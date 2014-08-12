class TutorialRequest < ActiveRecord::Base
	validates :subject, :level, :duration, presence: true

	belongs_to :user
	belongs_to :student, class_name: "User"
	belongs_to :tutors, class_name: "User"

end

