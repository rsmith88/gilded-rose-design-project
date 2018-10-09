require 'gilded_rose'
require 'item'

describe GildedRose do

  describe "#update_generic_items" do
    it "does not change the name" do
      item = Item.new("foo", 0, 0)
      GildedRose.new([item]).update_generic_items
      expect(item.name).to eq "foo"
    end

    it "never lowers quality below 0" do
      item = Item.new("item", 0, 0)
      GildedRose.new([item]).update_generic_items
      expect(item.quality).to eq(0)
    end

    context 'before sell_in' do
      it 'lowers quality by one after one day' do
        item = Item.new("item", 1, 1)
        GildedRose.new([item]).update_generic_items
        expect(item.quality).to eq(0)
      end
    end

    context 'after sell_in' do
      it 'lowers quality by two after a day' do
        item = Item.new("item", 0, 2)
        GildedRose.new([item]).update_generic_items
        expect(item.quality).to eq(0)
      end
    end

    context 'when item is not a generic item' do
      it 'does not change sell_in' do
        item = Item.new("Aged Brie", 1, 80)
        GildedRose.new([item]).update_generic_items
        expect(item.sell_in).to eq(1)
      end

      it 'does not change quality' do
        item = Item.new("Sulfuras", 1, 80)
        GildedRose.new([item]).update_generic_items
        expect(item.quality).to eq(80)
      end
    end
  end

  describe "#update_aged_cheese" do
    context 'before sell_in' do
      it 'raises quality by one after a day' do
        item = Item.new("Aged Brie", 1, 0)
        GildedRose.new([item]).update_aged_cheese
        expect(item.quality).to eq(1)
      end

      it 'never raises quality beyond 50' do
        item = Item.new("Aged Brie", 1, 50)
        GildedRose.new([item]).update_aged_cheese
        expect(item.quality).to eq(50)
      end
    end

    context 'after sell_in' do
      it 'raises quality by two after a day' do
        item = Item.new("Aged Brie", 0, 0)
        GildedRose.new([item]).update_aged_cheese
        expect(item.quality).to eq(2)
      end

      it 'only raises quality to 50 when quality is at 49' do
        item = Item.new("Aged Brie", 0, 49)
        GildedRose.new([item]).update_aged_cheese
        expect(item.quality).to eq(50)
      end
    end
  end
end


describe '#update_backstage_passes' do
  context 'when sell_in is greater than 10' do
    it 'increases quality by one after each day' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 0)
      GildedRose.new([item]).update_backstage_passes
      expect(item.quality).to eq(1)
    end

    it 'never increases quality beyond 50' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 50)
      GildedRose.new([item]).update_backstage_passes
      expect(item.quality).to eq(50)
    end
  end

  context 'when sell_in is less than or equal to 10 but more than 5' do
    it 'increases quality by two after each day' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 0)
      GildedRose.new([item]).update_backstage_passes
      expect(item.quality).to eq(2)
    end

    it 'only raises quality to 50 when quality is at 49' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 49)
      GildedRose.new([item]).update_backstage_passes
      expect(item.quality).to eq(50)
    end
  end

  context 'when sell_in is less than or equal to 5 but more than 0' do
    it 'increases quality by three after each day' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 0)
      GildedRose.new([item]).update_backstage_passes
      expect(item.quality).to eq(3)
    end

    it 'only raises quality to 50 when quality is at 48 or more' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 48)
      GildedRose.new([item]).update_backstage_passes
      expect(item.quality).to eq(50)
    end
  end

  context 'after sell_in' do
    it 'sets quality to 0' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 50)
      GildedRose.new([item]).update_backstage_passes
      expect(item.quality).to eq(0)
    end

    it 'does not change quality' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 0)
      GildedRose.new([item]).update_backstage_passes
      expect(item.quality).to eq(0)
    end
  end

end
