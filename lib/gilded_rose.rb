class GildedRose

  def initialize(items)
    @items = items
  end

  attr_reader :items

  def update_all
    @items.each do |item|
      BackstagePasses.new([item]).update_backstage_passes
      AgedCheese.new([item]).update_aged_cheeses
      GenericItem.new([item]).update_generic_items
      ConjuredItem.new([item]).update_conjured_items
      LegendaryItem.new([item]).update_legendary_items
      MagicBean.new([item]).update_magic_beans
    end
  end

end
