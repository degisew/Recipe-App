class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods
  validates :name, :description, :cooking_time, :preparation_time, presence: true
end
