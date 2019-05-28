require_relative "./menu_item"
class MenuModel
  def initialize
    @menu_items = []
  end

  def add_items(name, price)
    @menu_items << MenuItemModel.new(name, price)
  end

  def get_price(item_name)
    @menu_items.each do |item|
      if item.name == item_name
        return item.price
      end
    end
    return nil
  end
end