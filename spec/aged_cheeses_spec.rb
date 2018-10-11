require 'aged_cheeses'

describe AgedCheese do
  describe "#update_aged_cheeses" do
    it 'never raises quality beyond 50' do
      item = Item.new("Aged Brie", 1, 50)
      AgedCheese.new([item]).update_aged_cheeses
      expect(item.quality).to eq(50)
    end

    it 'only raises quality to 50 when quality is at 49' do
      item = Item.new("Aged Brie", 0, 49)
      AgedCheese.new([item]).update_aged_cheeses
      expect(item.quality).to eq(50)
    end

  context 'update_aged_brie' do
    it 'raises quality by one after a day before sell in' do
      item = Item.new("Aged Brie", 1, 0)
      AgedCheese.new([item]).update_aged_cheeses
      expect(item.quality).to eq(1)
    end

    it 'raises quality by two after a day after sell in' do
      item = Item.new("Aged Brie", 0, 0)
      AgedCheese.new([item]).update_aged_cheeses
      expect(item.quality).to eq(2)
    end
  end

  context 'update_aged_chedder' do
    it 'raises quality by one after a day before sell in' do
      item = Item.new("Aged Chedder", 1, 0)
      AgedCheese.new([item]).update_aged_cheeses
      expect(item.quality).to eq(1)
    end

    it 'raises quality by three after a day after sell in' do
      item = Item.new("Aged Chedder", 0, 0)
      AgedCheese.new([item]).update_aged_cheeses
      expect(item.quality).to eq(3)
    end
  end
end
end
