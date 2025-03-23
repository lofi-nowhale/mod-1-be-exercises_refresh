require 'rspec'
require './lib/potluck'
require './lib/dish'

describe Potluck do 
  describe '#initilize' do 
    it 'is a potluck' do 
      potluck = Potluck.new("7-13-18")

      expect(potluck).to be_a Potluck
    end

    it 'can read the date' do
      potluck = Potluck.new("7-13-18")
      expect(potluck.date).to eq "7-13-18"
    end
  end
  
  describe '#dishes' do
  it 'shows the dishes at the potluck - defaults to no dishes' do
    potluck = Potluck.new("7-13-18")
    expect(potluck.dishes).to eq []
    end
  end

  describe '#add_dish' do
    it 'adds a dish to the dishes list' do
      potluck = Potluck.new("7-13-18")
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(cocktail_meatballs)
      
      expect(potluck.dishes).to eq [couscous_salad, cocktail_meatballs]

      expect(potluck.dishes.length).to eq 2

    end
    it 'adds dishes into their respective categories' do
      potluck = Potluck.new("7-13-18")
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
      candy_salad = Dish.new("Candy Salad", :dessert)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(candy_salad)

      expect(potluck.categories[:appetizer].count).to eq 1
      expect(potluck.categories[:entre].count).to eq 1
      expect(potluck.categories[:dessert].count).to eq 1
    end
  end

  describe '#get_all_from_category' do
    it 'pulls all dishes from the given category' do
      potluck = Potluck.new("7-13-18")
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      summer_pizza = Dish.new("Summer Pizza", :appetizer)
      roast_pork = Dish.new("Roast Pork", :entre)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
      candy_salad = Dish.new("Candy Salad", :dessert)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(summer_pizza)
      potluck.add_dish(roast_pork)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(candy_salad)

      expect(potluck.get_all_from_category(:appetizer)).to eq [couscous_salad, summer_pizza]

      expect(potluck.get_all_from_category(:appetizer).first).to eq couscous_salad
      expect(potluck.get_all_from_category(:appetizer).first.name).to eq "Couscous Salad"
    end
  end

  describe '#menu' do
    it 'returns a has of each category with just the name of the dishes in an array' do
      potluck = Potluck.new("7-13-18")
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      summer_pizza = Dish.new("Summer Pizza", :appetizer)
      roast_pork = Dish.new("Roast Pork", :entre)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
      candy_salad = Dish.new("Candy Salad", :dessert)
      bean_dip = Dish.new("Bean Dip", :appetizer)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(summer_pizza)
      potluck.add_dish(roast_pork)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(candy_salad)
      potluck.add_dish(bean_dip)

      expect(potluck.menu).to eq ({:appetizer=>["Bean Dip", "Couscous Salad", "Summer Pizza"],:entre=>["Cocktail Meatballs", "Roast Pork"],:dessert=>["Candy Salad"]})
    end
  end
end