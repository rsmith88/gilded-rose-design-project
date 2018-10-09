class GildedRose

  def initialize(items)
    @items = items
  end

  attr_reader :generic_items

  def update_all
    update_aged_cheese
    update_backstage_passes
    update_generic_items
  end

  def update_aged_cheese
    @items.each do |item|
      if item.name == "Aged Brie"
        item.quality += 1 if item.sell_in > 0
        item.quality += 2 if item.sell_in <= 0
        item.quality = 50 if item.quality > 50
        item.sell_in -= 1
      end
    end
  end

  def update_generic_items
    @items.each do |item|
      next if item.name == "Aged Brie"
      next if item.name == "Sulfuras"
      next if item.name.include?("Backstage passes")
      item.quality -= 1 if item.sell_in > 0
      item.quality -= 2 if item.sell_in <= 0
      item.quality = 0 if item.quality < 0
      item.sell_in -= 1
    end
  end

  def update_backstage_passes
    @items.each do |item|
     if item.name.include?("Backstage passes")
       item.quality += 1 if item.sell_in > 10
       item.quality += 2 if item.sell_in.between?(6,10)
       item.quality += 3 if item.sell_in.between?(1,5)
       item.quality = 0 if item.sell_in <= 0
       item.quality = 50 if item.quality > 50
       item.sell_in -= 1
     end
   end
 end

end
