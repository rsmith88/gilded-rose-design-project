require 'generic_item'

describe GenericItem do

  describe "#update_generic_items" do
    context 'before sell_in' do
      it 'lowers quality by one after one day' do
        item = Item.new("item", 1, 1)
        GenericItem.new([item]).update_generic_items
        expect(item.quality).to eq(0)
      end
    end

    context 'after sell_in' do
      it 'lowers quality by two after a day' do
        item = Item.new("item", 0, 2)
        GenericItem.new([item]).update_generic_items
        expect(item.quality).to eq(0)
      end
    end
  end

  describe "#item_is_generic?" do
    it "returns true if item is generic" do
      item = Item.new("foo", 0, 0)
      expect(GenericItem.new([item]).is_generic?(item)).to eq true
    end

    it "returns false if item is not generic" do
      item = Item.new("Sulfuras", 1, 80)
      expect(GenericItem.new([item]).is_generic?(item)).to eq false
    end

    it "returns false if item is not generic" do
      item = Item.new("Backstage passes to test", 10, 10)
      expect(GenericItem.new([item]).is_generic?(item)).to eq false
    end
  end
end
