class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, :quantity, :price, :measurement_unit, presence: true
  validates :quantity, :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
