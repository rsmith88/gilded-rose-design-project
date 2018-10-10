require 'gilded_rose'
require 'item'

describe GildedRose do

  describe "update_all" do
    it "does not change the name of an item" do
      item = Item.new("foo", 0, 0)
      GildedRose.new([item]).update_all
      expect(item.name).to eq "foo"
    end

    it "never lowers quality below 0" do
      item = Item.new("item", 0, 0)
      GildedRose.new([item]).update_all
      expect(item.quality).to eq(0)
    end

    it 'updates generic item' do
      item = Item.new("test", 1, 80)
      GildedRose.new([item]).update_all
      expect(item.sell_in).to eq 0
      expect(item.quality).to eq 50
    end

    it 'updates back stage passes' do
      item = Item.new("Backstage passes", 10, 8)
      GildedRose.new([item]).update_all
      expect(item.sell_in).to eq 9
      expect(item.quality).to eq 10
    end

    it 'updates aged cheese' do
      item = Item.new("Aged Brie", -2, 40)
      GildedRose.new([item]).update_all
      expect(item.sell_in).to eq -3
      expect(item.quality).to eq 42
    end

    it 'updates cojured items' do
      item = Item.new("Conjured item", 10, 10)
      GildedRose.new([item]).update_all
      expect(item.sell_in).to eq 9
      expect(item.quality).to eq 8
    end

    it 'updates legendary items' do
      item = Item.new("Sulfuras", 0, 80)
      GildedRose.new([item]).update_all
      expect(item.sell_in).to eq 0
      expect(item.quality).to eq 80
    end

  end

end
