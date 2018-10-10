class GildedRose

  def initialize(items)
    @items = items
  end

  attr_reader :items

  def update_all
    @items.each do |item|
      SpecialItem.new([item]).update_special_items
      GenericItem.new([item]).update_generic_items
      ConjuredItem.new([item]).update_conjured_items
      LegendaryItem.new([item]).update_legendary_items
    end
  end

end
