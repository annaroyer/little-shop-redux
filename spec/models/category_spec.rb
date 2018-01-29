describe Category do
  describe "Validations" do
    it "is invalid without a name" do
      category_1 = Category.create(name: "Doyouwantmetotypeforyou")
      category_2 = Category.create

      expect(category_1).to be_valid
      expect(category_2).to be_invalid
    end
  end

  describe "Class Methods" do
    describe ".most_expensive_item" do
      it "returns the category with the most expensive item" do
        category_1 = Category.create(name: "clothing")
        category_1.items.create(title: "dress", description: "vintage", unit_price: 25000, image: "dress.jpg")
        category_1.items.create(title: "tshirt", description: "xxs", unit_price: 3500, image: "girl-in-tshirt/shirt.jpg")

        category_2 = Category.create(name: "technology")
        category_2.items.create(title: "cell phone", description: "iphone x", unit_price: 99900, image: "iphone-x.jpg")
        category_2.items.create(title: "survival flashlight", description: "multiple modes", unit_price: 4000, image: "best-survival-flashlight.jpg")

        category_3 = Category.create(name: "crafts")
        category_3.items.create(title: "glitter", description: "dangerous", unit_price: 150, image: "sparklesplosion.jpg")
        category_3.items.create(title: "felt", description: "fuzzy", unit_price: 250, image: "piece-of-felt.jpg")

        expect(Category.most_expensive_item.name).to eq("technology")
      end
    end

    describe ".least_expensive_item" do
      it 'returns the category with the least expensive item' do
        category_1 = Category.create(name: "clothing")
        category_1.items.create(title: "dress", description: "vintage", unit_price: 25000, image: "dress.jpg")
        category_1.items.create(title: "tshirt", description: "xxs", unit_price: 3500, image: "girl-in-tshirt/shirt.jpg")

        category_2 = Category.create(name: "technology")
        category_2.items.create(title: "cell phone", description: "iphone x", unit_price: 99900, image: "iphone-x.jpg")
        category_2.items.create(title: "survival flashlight", description: "multiple modes", unit_price: 4000, image: "best-survival-flashlight.jpg")

        category_3 = Category.create(name: "crafts")
        category_3.items.create(title: "glitter", description: "dangerous", unit_price: 150, image: "sparklesplosion.jpg")
        category_3.items.create(title: "felt", description: "fuzzy", unit_price: 250, image: "piece-of-felt.jpg")

        expect(Category.least_expensive_item.name).to eq("crafts")
      end
    end
  end

  describe "Instance Methods" do
    describe "#average_item_price" do
      it "returns the average item price for a category" do
        category = Category.create(name: "clothing")
        category.items.create(title: "dress", description: "vintage", unit_price: 25000, image: "dress.jpg")
        category.items.create(title: "tshirt", description: "xxs", unit_price: 3500, image: "girl-in-tshirt/shirt.jpg")
        category.items.create(title: "mumu", description: "really comfy", unit_price: 2000, image: "more-mumu.jpg")

        expect(category.average_item_price).to eq(101.67)
      end

      it "returns the average item price for a category with 2 decimal points for cents" do
          category = Category.create(name: "clothing")
          category.items.create(title: "dress", description: "vintage", unit_price: 2500, image: "dress.jpg")
          category.items.create(title: "tshirt", description: "xxs", unit_price: 3500, image: "girl-in-tshirt/shirt.jpg")
          category.items.create(title: "mumu", description: "really comfy", unit_price: 3000, image: "more-mumu.jpg")

          expect(category.average_item_price).to eq(30.00)
      end
    end
  end
end
