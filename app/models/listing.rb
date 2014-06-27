class Listing < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "default.jpg", 
  					:storage => :dropbox,
   					:dropbox_credentials => Rails.root.join("config/dropbox.yml")
  validates :name, presence: true 

  belongs_to :user, dependent: :delete


  end
