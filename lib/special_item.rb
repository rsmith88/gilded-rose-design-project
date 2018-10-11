require 'item'

class SpecialItem

  def initialize(items)
    @backstage_passes = items.select { |i| i.name.include? "Backstage passes" }
  end

  def update_special_items
    update_backstage_passes
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
