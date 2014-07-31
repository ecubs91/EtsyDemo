class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true  

  has_many :listings, dependent: :destroy
  has_many :sales, class_name: "Tutorial_Request", foreign_key: "tutor_id"
  has_many :purchases, class_name: "Tutorial_Request", foreign_key: "student_id"  
  has_many :reviews, dependent: :destroy

end
