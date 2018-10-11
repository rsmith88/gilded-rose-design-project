require 'legendary_item'

describe LegendaryItem do

  context 'when item includes Sulfuras' do
    it 'does not change sell_in' do
      item = Item.new("Sulfuras", 1, 80)
      LegendaryItem.new([item]).update_legendary_items
      expect(item.sell_in).to eq(1)
    end

    it 'does not change quality' do
      item = Item.new("Sulfuras", 1, 80)
      LegendaryItem.new([item]).update_legendary_items
      expect(item.quality).to eq(80)
    end
  end

  context 'when item includes Zulfuras' do
    it 'does not change sell_in' do
      item = Item.new("Zulfuras", 1, 80)
      LegendaryItem.new([item]).update_legendary_items
      expect(item.sell_in).to eq(1)
    end

    it 'does not change quality' do
      item = Item.new("Zulfuras", 1, 80)
      LegendaryItem.new([item]).update_legendary_items
      expect(item.quality).to eq(80)
    end
  end

end
