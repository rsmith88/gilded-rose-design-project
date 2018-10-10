class LegendaryItem

  def initialize(items)
    @legendary_items =  items.select { |i| i.name == "Sulfuras" }
  end

  attr_reader :update_legendary_items

  def update_legendary_items
    @legendary_items
  end

end
