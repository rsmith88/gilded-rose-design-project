require 'conjured_item'

describe ConjuredItem do

  describe "#update_conjured_items" do
    context 'before sell_in' do
      it 'lowers quality by one after one day' do
        item = Item.new("Conjured item", 1, 10)
        ConjuredItem.new([item]).update_conjured_items
        expect(item.quality).to eq(8)
      end
    end

    context 'after sell_in' do
      it 'lowers quality by two after a day' do
        item = Item.new("Conjured item", 0, 10)
        ConjuredItem.new([item]).update_conjured_items
        expect(item.quality).to eq(6)
      end
    end
  end
end
