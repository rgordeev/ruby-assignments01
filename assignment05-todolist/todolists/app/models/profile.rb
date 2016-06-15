class Profile < ActiveRecord::Base
	belongs_to :user
	validates :last_name, presence: true, if: "first_name.nil?"
	validates :first_name, presence: true, if: "last_name.nil?"
	validates :photo, presence: true
	validates :gender, inclusion: %w(male female)
	validate :sue_not_boy
	def sue_not_boy
		if first_name == "Sue" && gender == "male"
			errors.add(:first_name,"not allow a boy named Sue")
		end
	end
	def self.get_all_profiles(start_year, end_year)
		return Profile.where(["birth_year >= #{start_year} and birth_year <= #{end_year}"]).order(birth_year: :asc)
	end
end
