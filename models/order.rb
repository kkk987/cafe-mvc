class OrderModel
  attr_reader :order_items
  def initialize
    @order_items = Hash.new(0)
  end

  def add_order(name, quantity)
    @order_items[name] += quantity
  end
end