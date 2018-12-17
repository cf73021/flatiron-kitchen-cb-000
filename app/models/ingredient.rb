class Ingredient < ActiveRecord::Base
  validates :name, presence: true
  has_many :recipes, through: :recipe_ingredients
  has_many :recipe_ingredients

  def ingredient_params
  params.require(:ingredient).permit(:name)
end
end
