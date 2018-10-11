class LegendaryItem

  def initialize(items)
    @legendary_items =  items.select { |i| i.name.include? "ulfuras" }
  end

  def update_legendary_items
    @legendary_items
  end

end
