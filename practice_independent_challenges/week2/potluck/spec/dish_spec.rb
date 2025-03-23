require 'rspec'
require './lib/dish'

describe Dish do
  describe '#initialise' do
    it 'is a dish' do 
      dish = Dish.new('Couscous Salad', :appetizer)
      expect(dish).to be_a Dish
    end

    it 'can read the dish name' do 
      dish = Dish.new('Couscous Salad', :appetizer)
      expect(dish.name).to eq "Couscous Salad"
    end
  end

  it 'can read the dish category' do
    dish = Dish.new('Couscous Salad', :appetizer)
    expect(dish.category).to eq :appetizer
  end

end