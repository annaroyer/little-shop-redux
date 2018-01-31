describe Merchant do
  describe "Validations" do
    it "is invalid without a name" do
      merchant = Merchant.create

      expect(merchant).to be_invalid
    end
  end

  describe "Class Methods" do
    describe ".highest_priced_item" do
      it "returns the merchant with the highest priced item" do
        Merchant.create(name: "Dill")
        Item.create(title: 'pickles', description: 'spicy', unit_price: 500, image: 'pickle-jar.jpg', merchant_id: 1)
        Item.create(title: 'pickles', description: 'crunchy', unit_price: 300, image: 'pickle-jar.jpg', merchant_id: 1)
        Item.create(title: 'pickles', description: 'sour', unit_price: 400, image: 'pickle-jar.jpg', merchant_id: 1)

        merchant_2 = Merchant.create(name: "Sherry")
        Item.create(title: "Chardonnay", description: "California", unit_price: 5000, image: 'vinyard.jpg', merchant_id: 2)
        Item.create(title: "Pinot Grigio", description: "Italy", unit_price: 4500, image: 'wine-bottle.jpg', merchant_id: 2)

        Merchant.create(name: "Melanie")
        Item.create(title: "Watermelon", description: "seedless", unit_price: 350, image: 'picnic.jpg', merchant_id: 3)
        Item.create(title: "Cantaloupe", description: "medium", unit_price: 300, image: 'cantaloupe.jpg', merchant_id: 3)

        merchant_with_highest_priced_item = Merchant.highest_priced_item

        expect(merchant_with_highest_priced_item.name).to eq(merchant_2.name)
        expect(merchant_with_highest_priced_item.id).to eq(merchant_2.id)
      end
    end

    describe ".most_items" do
      it "returns the merchant with the most items" do
        merchant_1 = Merchant.create(name: "Dill")
        Item.create(title: 'pickles', description: 'spicy', unit_price: 500, image: 'pickle-jar.jpg', merchant_id: 1)
        Item.create(title: 'pickles', description: 'crunchy', unit_price: 300, image: 'pickle-jar.jpg', merchant_id: 1)
        Item.create(title: 'pickles', description: 'sour', unit_price: 400, image: 'pickle-jar.jpg', merchant_id: 1)

        merchant_2 = Merchant.create(name: "Sherry")
        Item.create(title: "Chardonnay", description: "California", unit_price: 5000, image: 'vineyard.jpg', merchant_id: 2)
        Item.create(title: "Pinot Grigio", description: "Italy", unit_price: 4500, image: 'wine-bottle.jpg', merchant_id: 2)

        merchant_3 = Merchant.create(name: "Melanie")
        Item.create(title: "Watermelon", description: "seedless", unit_price: 350, image: 'picnic.jpg', merchant_id: 3)
        Item.create(title: "Cantaloupe", description: "medium", unit_price: 300, image: 'cantaloupe.jpg', merchant_id: 3)

        merchant_with_most_items = Merchant.most_items

        expect(merchant_with_most_items.name).to eq(merchant_1.name)
        expect(merchant_with_most_items.id).to eq(merchant_1.id)
      end

      it "returns multiple merchants with the most items if there is a tie" do
        merchant_1 = Merchant.create(name: "Dill")
        Item.create(title: 'pickles', description: 'spicy', unit_price: 500, image: 'pickle-jar.jpg', merchant_id: 1)
        Item.create(title: 'pickles', description: 'crunchy', unit_price: 300, image: 'pickle-jar.jpg', merchant_id: 1)
        Item.create(title: 'pickles', description: 'sour', unit_price: 400, image: 'pickle-jar.jpg', merchant_id: 1)

        merchant_2 = Merchant.create(name: "Sherry")
        Item.create(title: "Chardonnay", description: "California", unit_price: 5000, image: 'vineyard.jpg', merchant_id: 2)
        Item.create(title: "Pinot Grigio", description: "Italy", unit_price: 4500, image: 'wine-bottle.jpg', merchant_id: 2)
        Item.create(title: "Cabernet", description: "New Zealand", unit_price: 4500, image: 'wine-glass.jpg', merchant_id: 2)

        Merchant.create(name: "Melanie")
        Item.create(title: "Watermelon", description: "seedless", unit_price: 350, image: 'picnic.jpg', merchant_id: 3)
        Item.create(title: "Cantaloupe", description: "medium", unit_price: 300, image: 'cantaloupe.jpg', merchant_id: 3)

        merchant_with_most_items = Merchant.most_items

        expect(merchant_with_most_items.count).to eq(2)
        expect(merchant_with_most_items.first.name).to eq(merchant_1.name)
        expect(merchant_with_most_items.last.name).to eq(merchant_2.name)
        expect(merchant_with_most_items.first.id).to eq(merchant_1.id)
        expect(merchant_with_most_items.last.nid).to eq(merchant_1.id)
      end
    end
  end

  describe "Instance Methods" do
    describe "#total_price_of_items" do
      it "finds the total price of all items" do
        merchant = Merchant.create(name: "Dill")
        merchant.items.create(title: 'pickles', description: 'spicy', unit_price: 500, image: 'pickle-jar.jpg', merchant_id: 1)
        merchant.items.create(title: 'peanut butter', description: 'crunchy', unit_price: 300, image: 'peanut-butter-jar.jpg', merchant_id: 1)
        merchant.items.create(title: 'lemons', description: 'sour', unit_price: 400, image: 'lemons.jpg', merchant_id: 1)

        expect(merchant.total_price_of_items).to eq(12.00)
      end
    end
  end
end
