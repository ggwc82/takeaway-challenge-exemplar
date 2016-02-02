class Order

  attr_reader :dishes

  def initialize(menu)
    @dishes = Hash.new(0)
    @menu = menu
  end

  def add(dish, quantity)
    fail NoItemError, "#{dish.capitalize} not on the menu!" unless menu.has_dish?(dish)
    dishes[dish] = quantity
  end

  def total
    item_totals.inject(:+)
  end

  private

  attr_reader :menu

  def item_totals
    dishes.map do |dish, quantity|
      menu.price(dish) * quantity
    end
  end
end

class NoItemError < StandardError; end