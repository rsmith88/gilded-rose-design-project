require 'update_methods'

class AgedCheese < UpdateMethods

  def initialize(items)
    @aged_brie = items.select { |i| i.name == "Aged Brie" }
    @aged_chedder = items.select { |i| i.name == "Aged Chedder" }
  end

  def update_aged_cheeses
    update(@aged_brie, 1, 2)
    update(@aged_chedder, 1, 3)
  end

end
