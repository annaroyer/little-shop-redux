  describe "As a user" do
  describe "When I visit '/categories-dashboard'" do
    it "I can see the average price of item by category" do
      category_1 = Category.create(name: "clothing")
      category_1.items.create(title: "dress", description: "vintage", unit_price: 25000, image: "dress.jpg")
      category_1.items.create(title: "tshirt", description: "xxs", unit_price: 3500, image: "girl-in-tshirt/shirt.jpg")

      category_2 = Category.create(name: "technology")
      category_2.items.create(title: "cell phone", description: "iphone x", unit_price: 99900, image: "iphone-x.jpg")
      category_2.items.create(title: "survival flashlight", description: "multiple modes", unit_price: 4000, image: "best-survival-flashlight.jpg")

      category_3 = Category.create(name: "crafts")
      category_3.items.create(title: "glitter", description: "dangerous", unit_price: 150, image: "sparklesplosion.jpg")
      category_3.items.create(title: "felt", description: "fuzzy", unit_price: 250, image: "piece-of-felt.jpg")

      visit '/categories-dashboard'

      expect(page).to have_content("Category: crafts, Average Price: $2.00")
      expect(page).to have_content("Category: technology, Average Price: $519.50")
      expect(page).to have_content("Category: clothing, Average Price: $142.50")
    end

    it "I can see the category with the most expensive item" do
      category_1 = Category.create(name: "clothing")
      category_1.items.create(title: "dress", description: "vintage", unit_price: 25000, image: "dress.jpg")
      category_1.items.create(title: "tshirt", description: "xxs", unit_price: 3500, image: "girl-in-tshirt/shirt.jpg")

      category_2 = Category.create(name: "technology")
      category_2.items.create(title: "cell phone", description: "iphone x", unit_price: 99900, image: "iphone-x.jpg")
      category_2.items.create(title: "survival flashlight", description: "multiple modes", unit_price: 4000, image: "best-survival-flashlight.jpg")

      category_3 = Category.create(name: "crafts")
      category_3.items.create(title: "glitter", description: "dangerous", unit_price: 150, image: "sparklesplosion.jpg")
      category_3.items.create(title: "felt", description: "fuzzy", unit_price: 250, image: "piece-of-felt.jpg")

      visit '/categories-dashboard'

      expect(page).to have_content("Category with Most Expensive Item: technology")
    end

    it "I can see the category with the least expensive item" do

        category_1 = Category.create(name: "clothing")
        category_1.items.create(title: "dress", description: "vintage", unit_price: 25000, image: "dress.jpg")
        category_1.items.create(title: "tshirt", description: "xxs", unit_price: 3500, image: "girl-in-tshirt/shirt.jpg")

        category_2 = Category.create(name: "technology")
        category_2.items.create(title: "cell phone", description: "iphone x", unit_price: 99900, image: "iphone-x.jpg")
        category_2.items.create(title: "survival flashlight", description: "multiple modes", unit_price: 4000, image: "best-survival-flashlight.jpg")

        category_3 = Category.create(name: "crafts")
        category_3.items.create(title: "glitter", description: "dangerous", unit_price: 150, image: "sparklesplosion.jpg")
        category_3.items.create(title: "felt", description: "fuzzy", unit_price: 250, image: "piece-of-felt.jpg")

        visit '/categories-dashboard'

        expect(page).to have_content("Category with Least Expensive Item: crafts")
    end
  end
end
