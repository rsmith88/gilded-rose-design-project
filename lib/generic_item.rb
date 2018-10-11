require 'update_methods'

class GenericItem
  include UpdateMethods

  def initialize(items)
    @generic_items = items.select { |i| is_generic?(i) }
  end

  def update_generic_items
    update(@generic_items, -1, -2)
  end

 def is_generic?(item)
   !(item.name == "Aged Brie" ||
     item.name == "Aged Chedder" ||
     item.name == "Sulfuras" ||
     item.name == "Yulfuras" ||
     item.name == "Conjured item" ||
     item.name == "Ultra conjured item" ||
     item.name == "Magic bean" ||
     item.name.include?("Backstage passes"))
 end

end
