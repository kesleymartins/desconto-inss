class Proponent < ApplicationRecord
  validates :name, presence: true
  validates :cpf, presence: true

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address

  has_many :phone_numbers, dependent: :destroy
end
