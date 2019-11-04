class Attendance < ApplicationRecord
	belongs_to :user
	belongs_to :event

	after_create :welcome_participation_send

  	def welcome_participation_send
    	AttendanceMailer.participation_email(self.event.administrator, self.user).deliver_now
  	end
end
