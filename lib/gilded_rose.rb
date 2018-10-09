class GildedRose

  def initialize(items)
    @items = items
  end

  attr_reader :items

  def update_all
    @items.each do |item|
      update_aged_cheese(item) if item.name == "Aged Brie"
      update_backstage_passes(item) if item.name.include?("Backstage passes")
      update_generic_items(item) if item_is_generic?(item)
      item.sell_in -= 1 if item.name != "Sulfuras"
    end
  end

  def update_aged_cheese(item)
    item.quality += 1 if item.sell_in > 0
    item.quality += 2 if item.sell_in <= 0
    item.quality = 50 if item.quality > 50
  end

  def update_generic_items(item)
    item.quality -= 1 if item.sell_in > 0
    item.quality -= 2 if item.sell_in <= 0
    item.quality = 0 if item.quality < 0
  end

  def update_backstage_passes(item)
     item.quality += 1 if item.sell_in > 10
     item.quality += 2 if item.sell_in.between?(6,10)
     item.quality += 3 if item.sell_in.between?(1,5)
     item.quality = 0 if item.sell_in <= 0
     item.quality = 50 if item.quality > 50
   end

   def item_is_generic?(item)
     !(item.name == "Aged Brie" ||
       item.name == "Sulfuras" ||
       item.name.include?("Backstage passes"))
   end

end
