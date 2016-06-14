class Profile < ActiveRecord::Base
	belongs_to :user
	validates :gender, inclusion: %w(male female)
	validates :photo, presence: true
	validates :last_name, presence: true, if: "first_name.nil?"
	validates :first_name, presence: true, if: "last_name.nil?"
	validate :deny_boy_named_sue

	def deny_boy_named_sue
		if(gender=="male" && first_name=="Sue")
			errors.add(:fisrt_name, "boy names Sue is not allowed")	
		end	
	end

	def self.get_all_profiles(startYear, endYear)
		Profile.where("birth_year <= ? AND birth_year >= ?", endYear, startYear).order(:birth_year)
	end
end

