class CreateProponents < ActiveRecord::Migration[7.0]
  def change
    create_table :proponents do |t|
      t.string :name, null: false
      t.string :cpf, null: false
      t.datetime :birthdate

      t.timestamps
    end
  end
end
