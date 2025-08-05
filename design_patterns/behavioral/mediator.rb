# The Mediator pattern is used to simplify complex communications and dependencies between multiple components
# in a system by centralizing their interactions through a single mediator object.
# This reduces the tight coupling between components, making the system easier to maintain, extend, and test.

# Trade-offs
# Mediator reduces coupling across components but pushes complexity into one place.
# You trade many direct dependencies between components for centralized control with some risk of large mediator logic.

class Buyer
  attr_accessor :balance

  def initialize(balance)
    @balance = balance
  end

  def use_agency_for_buying_house(agency)
    @agency = agency
  end

  def buy(house)
    @agency.purchase(house, self)
  end
end

class Seller
  attr_accessor :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def use_agency_for_selling_house(agency, house)
    agency.register(house)
  end
end

class House
  attr_reader :price, :owner

  def initialize(price, owner)
    @price = price
    @owner = owner
  end

  def new_owner(buyer)
    @owner = buyer
  end
end

# Mediator
class Agency
  def initialize
    @houses = []
  end

  def register(house)
    @houses << house
  end

  def purchase(house, buyer)
    if can_make_deal?(house, buyer)
      make_payment(house, buyer)
      change_owner(house, buyer)
    else
      puts "Deal failed: insufficient balance or house not listed."
    end
  end

  private

  def can_make_deal?(house, buyer)
    @houses.include?(house) && buyer.balance >= house.price
  end

  def make_payment(house, buyer)
    house.owner.balance += house.price
    buyer.balance -= house.price
  end

  def change_owner(house, buyer)
    house.new_owner(buyer)
    puts "Deal success: House bought for #{house.price} by buyer."
  end
end

# Sử dụng ví dụ
buyer = Buyer.new(1000)
seller = Seller.new(0)
house = House.new(100, seller)

agency = Agency.new
buyer.use_agency_for_buying_house(agency)
seller.use_agency_for_selling_house(agency, house)

buyer.buy(house)

puts "House current owner: #{house.owner == buyer ? 'Buyer' : 'Seller'}"
puts "Buyer balance: #{buyer.balance}"
puts "Seller balance: #{seller.balance}"
