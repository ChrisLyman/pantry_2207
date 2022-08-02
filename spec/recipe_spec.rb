require './lib/ingredient'
require './lib/recipe'

RSpec.describe Recipe do
  before do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
  end

  describe '#initialize' do
    it 'exsists' do

      expect(@recipe1).to be_instance_of(Recipe)
    end
  end

  describe '@name' do
    it 'has a name' do

      expect(@recipe1.name).to eq("Mac and Cheese")
    end
  end

  describe '@ingredients_required' do
    it 'has an empty hash of required ingredients' do

      expect(@recipe1.ingredients_required).to eq({})

      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient1, 4)
      @recipe1.add_ingredient(@ingredient2, 8)

      expect(@recipe1.ingredients_required).to eq({@ingredient1 => 6,
                                                   @ingredient2 => 8
                                                   })
    end
  end

  describe '#total_calories' do
    it 'calculates total_calories in a recipe' do

      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient2, 8)
      @recipe2.add_ingredient(@ingredient1, 2)
      @recipe2.add_ingredient(@ingredient3, 4)
      @recipe2.add_ingredient(@ingredient4, 1)

      expect(@recipe1.total_calories).to eq(440)
      expect(@recipe2.total_calories).to eq(675)
    end
  end
end
