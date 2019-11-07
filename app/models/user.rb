class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	has_many :attendances
	has_many :events, through: :attendance
	has_many :administrator_events, foreign_key: 'administrator_id', class_name: "Event"
  has_one_attached :avatar
	
	after_create :welcome_send

  	def welcome_send  
    	UserMailer.welcome_email(self).deliver_now
  	end
end
