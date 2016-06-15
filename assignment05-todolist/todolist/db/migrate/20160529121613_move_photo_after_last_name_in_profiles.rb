class MovePhotoAfterLastNameInProfiles < ActiveRecord::Migration
  def change
    change_column :profiles, :photo, :string, after: :last_name
  end
end
