class ConjuredItem

  def initialize(items)
    @conjured_items = items.select { |i| i.name == "Conjured item" }
    @ultra_conjured_items = items.select { |i| i.name == "Ultra conjured item" }
  end

  def update_conjured_items
    update(@conjured_items, 2, 4)
    update(@ultra_conjured_items, 3, 6)
  end

  def update(array, pre_sell_in, post_sell_in)
    array.each do | item |
      item.quality -= (pre_sell_in) if item.sell_in > 0
      item.quality -= (post_sell_in) if item.sell_in <= 0
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
