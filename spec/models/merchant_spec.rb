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
        merchant_1 = Merchant.create(name: "Dill")
        merchant_1.items.create(title: 'pickles', description: 'spicy', unit_price: 500, image: 'pickle-jar.jpg')
        merchant_1.items.create(title: 'pickles', description: 'crunchy', unit_price: 300, image: 'pickle-jar.jpg')
        merchant_1.items.create(title: 'pickles', description: 'sour', unit_price: 400, image: 'pickle-jar.jpg')

        merchant_2 = Merchant.create(name: "Sherry")
        merchant_2.items.create(title: "Chardonnay", description: "California", unit_price: 5000, image: 'vinyard.jpg')
        merchant_2.items.create(title: "Pinot Grigio", description: "Italy", unit_price: 4500, image: 'wine-bottle.jpg')

        merchant_3 = Merchant.create(name: "Melanie")
        merchant_3.items.create(title: "Watermelon", description: "seedless", unit_price: 350, image: 'picnic.jpg')
        merchant_3.items.create(title: "Cantaloupe", description: "medium", unit_price: 300, image: 'cantaloupe.jpg')

        expect(Merchant.highest_priced_item.name).to eq("Sherry")
      end
    end

    describe ".most_items" do
      it "returns the merchant with the most items" do
        merchant_1 = Merchant.create(name: "Dill")
        merchant_1.items.create(title: 'pickles', description: 'spicy', unit_price: 500, image: 'pickle-jar.jpg')
        merchant_1.items.create(title: 'pickles', description: 'crunchy', unit_price: 300, image: 'pickle-jar.jpg')
        merchant_1.items.create(title: 'pickles', description: 'sour', unit_price: 400, image: 'pickle-jar.jpg')

        merchant_2 = Merchant.create(name: "Sherry")
        merchant_2.items.create(title: "Chardonnay", description: "California", unit_price: 5000, image: 'vinyard.jpg')
        merchant_2.items.create(title: "Pinot Grigio", description: "Italy", unit_price: 4500, image: 'wine-bottle.jpg')

        merchant_3 = Merchant.create(name: "Melanie")
        merchant_3.items.create(title: "Watermelon", description: "seedless", unit_price: 350, image: 'picnic.jpg')
        merchant_3.items.create(title: "Cantaloupe", description: "medium", unit_price: 300, image: 'cantaloupe.jpg')

        expect(Merchant.most_items.name).to eq("Dill")
      end
    end
  end

  describe "Instance Methods" do
    describe "#total_price_of_items" do
      it "finds the total price of all items" do
        merchant = Merchant.create(name: "Dill")
        merchant.items.create(title: 'pickles', description: 'spicy', unit_price: 500, image: 'pickle-jar.jpg')
        merchant.items.create(title: 'peanut butter', description: 'crunchy', unit_price: 300, image: 'peanut-butter-jar.jpg')
        merchant.items.create(title: 'lemons', description: 'sour', unit_price: 400, image: 'lemons.jpg')

        expect(merchant.total_price_of_items).to eq(12.00)
      end
    end
  end
end
