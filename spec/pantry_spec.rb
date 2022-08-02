require './lib/ingredient'
require './lib/pantry'

RSpec.describe Pantry do
  before do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    @pantry = Pantry.new
  end

  describe '#initialize' do
    it 'exsists' do

      expect(@pantry).to be_instance_of(Pantry)
    end
  end

  describe '@stock' do
    it 'has an empty hash of stock' do

      expect(@pantry.stock).to eq({})
    end
  end

  describe '#stock_check' do
    it 'can check stock for a given ingredient' do

      expect(@pantry.stock_check(@ingredient1)).to eq(0)

      @pantry.restock(@ingredient1, 5)
      @pantry.restock(@ingredient1, 10)

      expect(@pantry.stock_check(@ingredient1)).to eq(15)

      @pantry.restock(@ingredient2, 7)

      expect(@pantry.stock_check(@ingredient2)).to eq(7)
    end
  end
end
