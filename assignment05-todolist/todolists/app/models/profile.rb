class Profile < ActiveRecord::Base
  belongs_to :user
  validates :first_name, presence: true, if: "last_name.nil?"
  validates :last_name, presence: true, if: "first_name.nil?"
  validate :sue_boy_is_forbidden
  validates :photo, presence: true
  validates_inclusion_of :gender, in: [ "male", "female" ]

  def sue_boy_is_forbidden
    if first_name == "Sue" && gender == "male"
      errors.add(:first_name,"Sue cannot be a boy name")
    end
  end

  def self.get_all_profiles(start_year, end_year)
    return Profile.where(["birth_year >= #{start_year} and birth_year <= #{end_year}"]).order(birth_year: :asc)
  end
end
