require 'item'
require 'gilded_rose'

class SpecialItem

  def initialize(items)
    @cheeses = items.select { |i| i.name == "Aged Brie" }
    @backstage_passes = items.select { |i| i.name.include? "Backstage passes" }
  end

  attr_reader :updated_special_items

  def update_special_items
    update_cheeses
    update_backstage_passes
  end

  def update_cheeses
    @cheeses.each do | item |
    item.quality += 1 if item.sell_in > 0
    item.quality += 2 if item.sell_in <= 0
    limit_quality(item)
    item.sell_in -= 1
   end
  end

  def update_backstage_passes
    @backstage_passes.each do |item|
       item.quality += 1 if item.sell_in > 10
       item.quality += 2 if item.sell_in.between?(6,10)
       item.quality += 3 if item.sell_in.between?(1,5)
       item.quality = 0 if item.sell_in <= 0
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
