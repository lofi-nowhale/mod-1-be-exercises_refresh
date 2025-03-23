class Potluck
  attr_reader :date, :dishes, :categories, :menu
  def initialize(date)
    @date = date
    @dishes = []
    @categories = {
      :appetizer => [],
      :entre => [],
      :dessert => []
    }
    @the_menu = {
      :appetizer => [],
      :entre => [],
      :dessert => []
    }
  end

  def add_dish(dish)
    @dishes << dish
    @categories[dish.category] << dish
    @the_menu[dish.category] << dish.name
  end

  def get_all_from_category(category)
    @categories[category]
  end

  def menu
    @the_menu.transform_values do |dishes|
      dishes.sort
    end
  end

end