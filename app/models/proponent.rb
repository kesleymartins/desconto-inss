class Proponent < ApplicationRecord
  validates :name, presence: true
  validates :cpf, presence: true
  validates :discount, presence: true, if: proc { |a| a.salary.present? }

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address

  has_many :phone_numbers, dependent: :destroy

  scope :count_by_salary_range, lambda { |min, max|
    where(salary: min..max).count
  }
end
