class Tutor < ActiveRecord::Base

	searchkick text_start: [:teaching_subject]
	
  has_attached_file :image, :styles => { :medium => "200x200>", :thumb => "100x100>" }, :default_url => "default.jpg", 
  					:storage => :dropbox,
   					:dropbox_credentials => Rails.root.join("config/dropbox.yml")
  validates :university, presence: true 

  belongs_to :user, dependent: :delete
  has_many :tutorial_requests
  has_many :reviews
end
