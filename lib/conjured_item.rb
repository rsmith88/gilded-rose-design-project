require 'update_methods'

class ConjuredItem
  include UpdateMethods

  def initialize(items)
    @conjured_items = items.select { |i| i.name == "Conjured item" }
    @ultra_conjured_items = items.select { |i| i.name == "Ultra conjured item" }
  end

  def update_conjured_items
    update(@conjured_items, -2, -4)
    update(@ultra_conjured_items, -3, -6)
  end

end
