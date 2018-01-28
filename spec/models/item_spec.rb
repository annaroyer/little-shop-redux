describe Item do
  describe "Validations" do
    it "is invalid without a title" do
      item = Item.create(description: "soft and fluffy", unit_price: 3500, image: "http://tinypuppy.png")

      expect(item).to be_invalid
    end

    it "is invalid without a description" do
      item = Item.create(title: "puppy", unit_price: 3500, image: "http://tinypuppy.png")

      expect(item).to be_invalid
    end

    it "is invalid without a price" do
      item = Item.create(title: "puppy", description: "soft and fluffy", image: "http://tinypuppy.png")

      expect(item).to be_invalid
    end

    it "is invalid without an image" do
      item = Item.create(title: "puppy", description: "soft and fluffy", unit_price: 3500)

      expect(item).to be_invalid
    end
  end

  describe "Instance Methods" do
    describe "#price" do
      it "returns an price in dollars as a decimal" do
        item = Item.create(title: "puppy", description: "soft and fluffy", unit_price: 3599, image: "http://tinypuppy.png")

        expect(item.price).to eq(35.99)
      end
    end
  end

  describe "Class Methods" do
    describe ".total_item_count" do
      it "returns total item count" do
        item_1 = Item.create(title: "dress", description: "vintage", unit_price: 25000, image: "dress.jpg")
        item_2 = Item.create(title: "shirt", description: "small", unit_price: 25000, image: "dress.jpg")
        item_3 = Item.create(title: "pantalon", description: "viejo", unit_price: 25000, image: "dress.jpg")
      end
    end
  end

end
