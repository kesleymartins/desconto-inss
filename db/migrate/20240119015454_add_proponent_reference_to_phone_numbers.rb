class AddProponentReferenceToPhoneNumbers < ActiveRecord::Migration[7.0]
  def change
    change_table :phone_numbers do |t|
      t.belongs_to :proponent, null: false, foreign_key: true, index: true
    end
  end
end
