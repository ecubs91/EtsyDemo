class Proposal < ActiveRecord::Base
	belongs_to :user
	belongs_to :tutorial_request


end
