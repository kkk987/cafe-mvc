require_relative "./order"
require_relative "./menu"

class CafeModel
  def initialize(name, menu_items)
    # menu_items is expected to be a hash
    @name = name
    @menu = MenuModel.new
    @order = nil
    populate_menu(menu_items)
  end

  def menu
    return @menu.menu_items
  end

  def populate_menu(menu_items)
    menu_items.each do |name, price|
      @menu.add_items(name, price)
    end
  end

  def validate_item(choice)
    @menu.menu_items.each do |item|
      if choice[0].downcase == item.name[0].downcase
        return choice
      end
    end
    return nil
  end

  def create_order
    if !@order
      @order = OrderModel.new
    end
    return @order
    # @order = OrderModel.new
  end

  def add_to_order(name,quantity)
    @order.add_order(name, quantity)
  end

  def order_total
    total = 0
    @order.order_items.each do |item, quantity|
      total += @menu.get_price(item) * quantity
    end
    return total
  end
end