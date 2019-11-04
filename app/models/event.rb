class Event < ApplicationRecord
	has_many :attendances
	has_many :users, through: :attendance

	validates :start_date, presence: true,
	if: :is_gone?

	validates :duration, presence: true,
	numericality: { greater_than: 0 },
	if: :duration_5?

	validates :title,
	presence: true,
	length: {minimum: 5, maximum: 140}

	validates :description, presence: true,
	length: { minimum: 20, maximum: 1000}

	validates :price, presence: true,
	numericality: { greater_than: 1, less_than: 1000 , only_integer: true}

	validates :location, presence: true

	def duration_5?
		return self.duration % 5 == 0
	end
	def is_gone?
		return self.start_date > DateTime.now
	end
end
