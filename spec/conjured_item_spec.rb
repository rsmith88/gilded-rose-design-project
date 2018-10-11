require 'conjured_item'

describe ConjuredItem do

  describe "#update_conjured_items" do
    context 'conjured items' do
      it 'lowers quality by two after one day before sell in date' do
        item = Item.new("Conjured item", 1, 10)
        ConjuredItem.new([item]).update_conjured_items
        expect(item.quality).to eq(8)
      end

      it 'lowers quality by four after a day sell in date' do
        item = Item.new("Conjured item", 0, 10)
        ConjuredItem.new([item]).update_conjured_items
        expect(item.quality).to eq(6)
      end
    end

    context 'ultra conjured items' do
      it 'lowers quality by three after one day before sell in date' do
        item = Item.new("Ultra conjured item", 1, 10)
        ConjuredItem.new([item]).update_conjured_items
        expect(item.quality).to eq(7)
      end

      it 'lowers quality by six after a day sell in date' do
        item = Item.new("Ultra conjured item", 0, 10)
        ConjuredItem.new([item]).update_conjured_items
        expect(item.quality).to eq(4)
      end
    end

  end
end
