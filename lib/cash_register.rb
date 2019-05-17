require "pry"

class CashRegister

  attr_accessor :total, :discount, :cart

  def initialize(discount= 0)
    @total = 0
    @discount = discount
    @cart = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity=1)

    @total += (price * quantity)
    quantity.times do
      @cart << title
    end
    #keep track of the last item's price
    @last_transaction = price
    #binding.pry
  end

  def apply_discount
    if discount == 0
      return "There is no discount to apply."
    end
    percentage = @total * (discount.to_f/100)
    @total -= percentage
    return "After the discount, the total comes to $#{@total.to_i}."
    #@total = @total - (@total/discount.to_f)
    #binding.pry
  end

  def items
    @cart
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end
