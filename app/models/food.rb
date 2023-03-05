class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods
  validates :name, :measurement_unit, :price, :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0 }
end
