class UpdateBirthdateType < ActiveRecord::Migration[7.0]
  def up
    change_column :proponents, :birthdate, :date
  end

  def down
    change_column :proponents, :birthdate, :datetime
  end
end
