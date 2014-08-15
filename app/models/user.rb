class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true  

  has_one :tutor, dependent: :destroy
  has_many :tutorial_requests, dependent: :destroy


  # User can be a student, a tutor or both and can have both the tuition and tutorial request records 
  # foreign key tells Rails to use the tutor_ID to figure out which user was the tutor for this tutorial request
  has_many :tutors, class_name: "Tutorial_Request", foreign_key: "tutor_id"
  has_many :students, class_name: "Tutorial_Request", foreign_key: "student_id"  
  has_many :reviews, dependent: :destroy
  
end
