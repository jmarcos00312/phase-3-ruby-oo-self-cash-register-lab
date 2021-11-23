require 'pry'
class CashRegister
  attr_accessor :total, :discount, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_trans = 0
  end

  attr_writer :total

  def add_item(title, price, quantity = 1)
    @last_trans = price * quantity
    self.total += price * quantity
    quantity.times do
      items << title
    end
  end

  def apply_discount
    if discount == 0
        'There is no discount to apply.'
    else
        to_percent = (100 - discount.to_f) / 100
      self.total *= to_percent
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def void_last_transaction
    @total -= @last_trans
  end
end
