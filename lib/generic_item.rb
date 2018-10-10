require 'item'

class GenericItem

  def initialize(items)
    @generic_items = items.select { |i| is_generic?(i) }
  end

  attr_reader :update_generic_items

  def update_generic_items
    @generic_items.each do | item |
      item.quality -= 1 if item.sell_in > 0
      item.quality -= 2 if item.sell_in <= 0
      limit_quality(item)
      item.sell_in -= 1
    end
  end

  def is_generic?(item)
    !(item.name == "Aged Brie" ||
      item.name == "Sulfuras" ||
      item.name == "Conjured item" ||
      item.name.include?("Backstage passes"))
  end

   def limit_quality(item)
     item.quality = 0 if item.quality <= 0
     item.quality = 50 if item.quality > 50
     nil
   end

end
