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

    it "is invalid without a unit price" do
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
      it "returns price in dollars as a decimal" do
        item = Item.create(title: "puppy", description: "soft and fluffy", unit_price: 3599, image: "http://tinypuppy.png")

        expect(item.price).to eq(35.99)
      end
    end
  end

  describe "Class Methods" do

    describe ".average_price" do
      it "returns average price per item" do
        Item.create(title: "dress", description: "vintage", unit_price: 25000, image: "banner.jpeg")
        Item.create(title: "shirt", description: "small", unit_price: 5000, image: "banner.jpeg")
        Item.create(title: "pantalon", description: "viejo", unit_price: 3000, image: "banner.jpeg")

        expect(Item.average_price).to eq(110.00)
      end
    end

    describe ".most_expensive_item" do
      it "returns the most recently created item" do
        Item.create(title: "dress", description: "vintage", unit_price: 25000, image: "banner.jpeg")
        Item.create(title: "shirt", description: "small", unit_price: 5000, image: "banner.jpeg")
        most_recent = Item.create(title: "pantalon", description: "viejo", unit_price: 3000, image: "banner.jpeg")

        expect(Item.most_recently_created).to eq(most_recent)
      end
    end

    describe ".oldest" do
      it "returns the most recently created item" do
        oldest = Item.create(title: "dress", description: "vintage", unit_price: 25000, image: "banner.jpeg")
        Item.create(title: "shirt", description: "small", unit_price: 5000, image: "banner.jpeg")
        Item.create(title: "pantalon", description: "viejo", unit_price: 3000, image: "banner.jpeg")

        expect(Item.oldest).to eq(oldest)
      end
    end

    describe ".total_price" do
      it "returns the total price of all items" do
        Item.create(title: "dress", description: "vintage", unit_price: 25000, image: "banner.jpeg")
        Item.create(title: "shirt", description: "small", unit_price: 5000, image: "banner.jpeg")
        Item.create(title: "pantalon", description: "viejo", unit_price: 3000, image: "banner.jpeg")

        expect(Item.total_price).to eq(330)
      end
    end
  end
end
