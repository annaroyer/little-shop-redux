describe Item do
  describe 'Validations' do
    it 'is invalid without a title' do
      item = Item.create(description: 'soft and fluffy', unit_price: 35, image: "http://tinypuppy.png")

      expect(item).to be_invalid
    end

    it 'is invalid without a description' do
      item = Item.create(title: 'puppy', unit_price: 35, image: "http://tinypuppy.png")

      expect(item).to be_invalid
    end

    it 'is invalid without a unit_price' do
      item = Item.create(title: 'puppy', description: 'soft and fluffy', image: "http://tinypuppy.png")

      expect(item).to be_invalid
    end

    it 'is invalid without an image' do
      item = Item.create(title: 'puppy', description: 'soft and fluffy', unit_price: 35)

      expect(item).to be_invalid
    end
  end
end
