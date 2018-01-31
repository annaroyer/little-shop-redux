describe "As a user" do
  describe "when I visit items index page" do
    it "I can see all items" do
      Item.create(title: 'puppy', description: 'soft and fluffy', unit_price: 5500, image: "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg")
      Item.create(title: 'raccoon', description: 'has little hands', unit_price: 5500, image: "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg")
      Item.create(title: 'puppy', description: 'soft and fluffy', unit_price: 5500, image: "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg")

      visit "/items"

      expect(page).to have_content("puppy")
    end

    it "I can click on new item" do
      visit "/items"

      click_on "New Item"

      expect(current_path).to eq("/items/new")
    end

    it "I can click on edit an item" do
      Item.create(title: 'puppy', description: 'soft and fluffy', unit_price: 3500, image: "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg")

      visit "/items"

      first(:button, "Edit").click

      expect(current_path).to eq("/items/1/edit")
    end

    it "I can click on delete an item" do
      Item.create(title: 'puppy', description: 'soft and fluffy', unit_price: 3500, image: "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg")
      Item.create(title: 'raccoon', description: 'has little hands', unit_price: 5500, image: "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg")

      visit "/items"

      first(:button, "Delete Item").click

      expect(current_path).to eq("/items")
    end
  end
end
