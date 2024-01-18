class Address < ApplicationRecord
  validates :street, presence: true
  validates :number, presence: true
  validates :district, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :state, presence: true

  belongs_to :proponent
end
