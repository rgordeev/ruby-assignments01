class Profile < ActiveRecord::Base
belongs_to :user
validates :photo, presence: true
validates :first_name, presence: true, if: 'last_name.nil?'
validates :last_name, presence: true, if: 'first_name.nil?'
validates :gender, presence: true, inclusion: ['male','female']
validate :sue_not_allowed
def sue_not_allowed
if first_name == 'Sue' && gender == 'male'
 errors.add(:first_name,'Sue is not allowed');
end
end
def self.get_all_profiles(start, finish)
return Profile.where(["birth_year >= #{ start } and birth_year <= #{ finish }"]).order(birth_year: :asc)
end
end
