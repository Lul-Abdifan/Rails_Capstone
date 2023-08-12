class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  validates :name, presence: true
  validates :preparation_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cooking_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true
  validates :user, presence: true

  scope :public_recipes, -> { where(public: true) }

  # Calculate the total number of food items in the recipe
  def total_food_items
    foods.count
  end

  # Calculate the total price of all food items in the recipe
  def total_price
    foods.sum(:price)
  end
end
