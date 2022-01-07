require "pry"

class CashRegister

  attr_accessor :discount, :total, :cart, :prior_transaction

  def initialize(discount=0, total=0)
    @total = total
    @discount = discount
    @cart = []
  end

  def add_item(title, price=0.0, quantity=1)
    self.prior_transaction = price * quantity
    self.total += self.prior_transaction 
    while quantity != 0
      self.cart << title
      quantity -= 1
    end 
  end 

  def apply_discount
    if discount != 0
      self.total -= (total * discount / 100)
      "After the discount, the total comes to $#{total}."
    else
      "There is no discount to apply."
    end 
  end 

  def items 
    cart
  end 

  def void_last_transaction
    self.total -= self.prior_transaction 
    
  end 

end # Ends class CashRegister
