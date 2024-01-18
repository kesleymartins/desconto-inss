class Proponent < ApplicationRecord
  validates :name, presence: true
  validates :cpf, presence: true

  has_one :address
  accepts_nested_attributes_for :address
end
