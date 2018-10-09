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
      GildedRose.new([item]).update_generic_items(item)
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

    context 'when item is a legendary item' do
      it 'does not change sell_in' do
        item = Item.new("Sulfuras", 1, 80)
        GildedRose.new([item]).update_all
        expect(item.sell_in).to eq(1)
      end

      it 'does not change quality' do
        item = Item.new("Sulfuras", 1, 80)
        GildedRose.new([item]).update_all
        expect(item.quality).to eq(80)
      end
    end

  end

  describe "#update_conjured_items" do
    context 'before sell_in' do
      it 'lowers quality by one after one day' do
        item = Item.new("Conjured item", 1, 10)
        GildedRose.new([item]).update_conjured_items(item)
        expect(item.quality).to eq(8)
      end
    end

    context 'after sell_in' do
      it 'lowers quality by two after a day' do
        item = Item.new("item", 0, 10)
        GildedRose.new([item]).update_conjured_items(item)
        expect(item.quality).to eq(6)
      end
    end
  end

  describe "#update_generic_items" do
    context 'before sell_in' do
      it 'lowers quality by one after one day' do
        item = Item.new("item", 1, 1)
        GildedRose.new([item]).update_generic_items(item)
        expect(item.quality).to eq(0)
      end
    end

    context 'after sell_in' do
      it 'lowers quality by two after a day' do
        item = Item.new("item", 0, 2)
        GildedRose.new([item]).update_generic_items(item)
        expect(item.quality).to eq(0)
      end
    end
  end

  describe "#update_aged_cheese" do
    context 'before sell_in' do
      it 'raises quality by one after a day' do
        item = Item.new("Aged Brie", 1, 0)
        GildedRose.new([item]).update_aged_cheese(item)
        expect(item.quality).to eq(1)
      end

      it 'never raises quality beyond 50' do
        item = Item.new("Aged Brie", 1, 50)
        GildedRose.new([item]).update_aged_cheese(item)
        expect(item.quality).to eq(50)
      end
    end

    context 'after sell_in' do
      it 'raises quality by two after a day' do
        item = Item.new("Aged Brie", 0, 0)
        GildedRose.new([item]).update_aged_cheese(item)
        expect(item.quality).to eq(2)
      end

      it 'only raises quality to 50 when quality is at 49' do
        item = Item.new("Aged Brie", 0, 49)
        GildedRose.new([item]).update_aged_cheese(item)
        expect(item.quality).to eq(50)
      end
    end
  end

  describe '#update_backstage_passes' do
    context 'when sell_in is greater than 10' do
      it 'increases quality by one after each day' do
        item = Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 0)
        GildedRose.new([item]).update_backstage_passes(item)
        expect(item.quality).to eq(1)
      end

      it 'never increases quality beyond 50' do
        item = Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 50)
        GildedRose.new([item]).update_backstage_passes(item)
        expect(item.quality).to eq(50)
      end
    end

    context 'when sell_in is less than or equal to 10 but more than 5' do
      it 'increases quality by two after each day' do
        item = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 0)
        GildedRose.new([item]).update_backstage_passes(item)
        expect(item.quality).to eq(2)
      end

      it 'only raises quality to 50 when quality is at 49' do
        item = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 49)
        GildedRose.new([item]).update_backstage_passes(item)
        expect(item.quality).to eq(50)
      end
    end

    context 'when sell_in is less than or equal to 5 but more than 0' do
      it 'increases quality by three after each day' do
        item = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 0)
        GildedRose.new([item]).update_backstage_passes(item)
        expect(item.quality).to eq(3)
      end

      it 'only raises quality to 50 when quality is at 48 or more' do
        item = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 48)
        GildedRose.new([item]).update_backstage_passes(item)
        expect(item.quality).to eq(50)
      end
    end

    context 'after sell_in' do
      it 'sets quality to 0' do
        item = Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 50)
        GildedRose.new([item]).update_backstage_passes(item)
        expect(item.quality).to eq(0)
      end

      it 'does not change quality' do
        item = Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 0)
        GildedRose.new([item]).update_backstage_passes(item)
        expect(item.quality).to eq(0)
      end
    end
  end

  describe "update_conjured" do
    end

  describe "#item_is_generic?" do
      it "returns true if item is generic" do
        item = Item.new("foo", 0, 0)
        expect(GildedRose.new([item]).item_is_generic?(item)).to eq true
      end

      it "returns false if item is not generic" do
        item = Item.new("Sulfuras", 1, 80)
        expect(GildedRose.new([item]).item_is_generic?(item)).to eq false
      end

      it "returns false if item is not generic" do
        item = Item.new("Backstage passes to test", 10, 10)
        expect(GildedRose.new([item]).item_is_generic?(item)).to eq false
      end
    end

end
