class Proponent < ApplicationRecord
  validates :name, presence: true
  validates :cpf, presence: true
end
