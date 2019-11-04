class User < ApplicationRecord
	has_many :attendances
	has_many :events, through: :attendance
	has_many :administrator_events, foreign_key: 'administrator_id', class_name: "Event"
	
	#after_create :welcome_send

  	#def welcome_send
    	#UserMailer.welcome_email(self).deliver_now
  	#end
end
