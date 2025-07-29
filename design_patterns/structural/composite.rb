# Menu acts as the composite containing other menus or menu items.
# MenuItem is the leaf node with no children.
# The display method recursively shows the tree hierarchy of menus and items.
# This pattern is very useful in web apps to represent layered navigations, dropdowns, organizational charts,
# or any hierarchical UI component where composite and leaf nodes should be treated the same way with a common interface.

# Base Component class
class MenuComponent
  def add(component)
    raise NotImplementedError, "#{self.class} does not implement add"
  end

  def remove(component)
    raise NotImplementedError, "#{self.class} does not implement remove"
  end

  def display(indent = 0)
    raise NotImplementedError, "#{self.class} does not implement display"
  end
end

# Composite class - menu or submenu that can have children
class Menu < MenuComponent
  def add(component)
    @children << component
  end

  def remove(component)
    @children.delete(component)
  end

  def display(indent = 0)
    puts "#{' ' * indent}#{@name}"
    @children.each { |child| child.display(indent + 2) }
  end
end

# Leaf class - individual menu item
class MenuItem < MenuComponent
  attr_reader :name, :price

  def initialize(name, price)
    super
    @name = name
    @price = price
  end

  def display(indent = 0)
    puts "#{' ' * indent}- #{@name}: $#{@price}"
  end
end

# Usage
main_menu = Menu.new('Main Menu')
breakfast_menu = Menu.new('Breakfast')
lunch_menu = Menu.new('Lunch')

pancakes = MenuItem.new('Pancakes', 5.99)
coffee = MenuItem.new('Coffee', 1.99)
burger = MenuItem.new('Burger', 8.99)
salad = MenuItem.new('Salad', 7.99)

breakfast_menu.add(pancakes)
breakfast_menu.add(coffee)

lunch_menu.add(burger)
lunch_menu.add(salad)

main_menu.add(breakfast_menu)
main_menu.add(lunch_menu)

main_menu.display
