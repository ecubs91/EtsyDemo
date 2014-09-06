class Tutorship < ActiveRecord::Base
  belongs_to :tutor, class_name: "User"
  belongs_to :student, class_name: "User"
  belongs_to :subject

  # scopes defined as class methods
  class << self

    def accepted
      where(accepted: true)
    end

    def rejected
      where(accepted: false)
    end

    def pending
      where("tutorships.accepted IS NULL")
    end

    def pending_invites_from_student
      pending.where(created_by_student: true)
    end

    def rejected_invites_from_student
      rejected.where(created_by_student: true)
    end

  end 
end
