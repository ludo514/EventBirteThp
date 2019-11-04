class Event < ApplicationRecord
	has_many :attendances
	has_many :users, through: :attendance
	belongs_to :administrator, class_name: "User"

	validates :start_date, presence: true
	validate :is_gone?

	validates :duration,presence: true, numericality: { greater_than: 0 }
	validate :duration_5?
	

	validates :title, presence: true,
	length: {minimum: 5, maximum: 140}

	validates :description, presence: true,
	length: { minimum: 20, maximum: 1000}

	validates :price, presence: true,
	numericality: { greater_than: 1, less_than: 1000 , only_integer: true}

	validates :location, presence: true

	def duration_5?
		errors.add(:duration, "La durée doit être un multiple de 5") unless
		self.duration % 5 == 0 
	end

	def is_gone?
		errors.add(:start_date, "La date doit être supérieur")unless 
		self.start_date > DateTime.now 
	end

end
