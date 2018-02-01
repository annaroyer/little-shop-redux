describe "As a user" do
  describe "when I visit merchants-dashboard" do
    it "I can see the merchant with the most items" do
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

      visit "merchants-dashboard"

      expect(page).to have_content("Dill")
    end

    it "I can see the merchant with the highest priced item" do
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

      visit "/merchants-dashboard"

      expect(page).to have_content("Sherry")
    end

    describe "I can see a breakdown of each merchant" do
      it "with the total number of items" do
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

        visit "/merchants-dashboard"

        expect(page).to have_content("3")
        expect(page).to have_content("2")
      end

      it "with the total price for all items" do
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

        visit "/merchants-dashboard"

        expect(page).to have_content("$12.00")
        expect(page).to have_content("$95.00")
        expect(page).to have_content("$6.50")
      end
    end
  end
end
