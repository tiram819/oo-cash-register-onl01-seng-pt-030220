
class CashRegister
  attr_accessor :total, :discount, :price, :items, :lasttransaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, transaction = 1)
    @price = price
    @total += price * transaction
    if transaction > 1
      counter = 0
      while counter < transaction
        @items << item
        counter += 1
      end
    else
      @items << item
    end
    @lasttransaction = price * transaction
  end

  def apply_discount
    if @discount > 0
      @to_take_off = (price * discount)/100
      @total -= @to_take_off
      return "After the discount, the total comes to $#{total}."
    else
      return "There is no discount to apply."
    end
  end

 def void_last_transaction()
    self.total -= self.lasttransaction
end

end