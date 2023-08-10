class Food < ApplicationRecord
  belongs_to :user

  validates :name, :quantity, :price, :measurement_unit, presence: true
  validates :quantity, :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end