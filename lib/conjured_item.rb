class ConjuredItem

  def initialize(items)
    @conjured_items = items.select { |i| i.name == "Conjured item" }
  end

  attr_reader :update_conjured_items

  def update_conjured_items
    @conjured_items.each do | item |
      item.quality -= 2 if item.sell_in > 0
      item.quality -= 4 if item.sell_in <= 0
      limit_quality(item)
      item.sell_in -= 1
    end
  end

   def limit_quality(item)
     item.quality = 0 if item.quality <= 0
     item.quality = 50 if item.quality > 50
     nil
   end
end
