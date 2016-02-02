class Menu
  def initialize(dishes)
    @dishes = dishes
  end

  attr_reader :dishes

  def print
    dishes.map do |title, price|
      "%s $%.2f" % [title.to_s.capitalize, price]
    end.join(", ")
  end

end