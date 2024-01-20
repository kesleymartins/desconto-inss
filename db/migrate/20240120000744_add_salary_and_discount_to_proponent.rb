class AddSalaryAndDiscountToProponent < ActiveRecord::Migration[7.0]
  def change
    change_table :proponents do |t|
      t.decimal :salary, precision: 8, scale: 2
      t.decimal :discount, precision: 8, scale: 2
    end
  end
end
