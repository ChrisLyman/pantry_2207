require './lib/recipe'
require './lib/cook_book'

RSpec.describe CookBook do
  before do
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
    @cookbook = CookBook.new
  end

  describe '#initialize' do
    it 'exsists' do

      expect(@cookbook).to be_instance_of(CookBook)
    end
  end

  describe '@recipes' do
    it 'has an array of recipes' do

      expect(@cookbook.recipes).to eq([])

      @cookbook.add_recipe(@recipe1)
      @cookbook.add_recipe(@recipe2)

      expect(@cookbook.recipes).to eq([@recipe1, @recipe2])
    end
  end
end
