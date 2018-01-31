describe "As a user" do
  describe "when I visit /items" do
    it "I can delete a item" do
      Item.create(title: 'puppy', description: 'soft and fluffy', unit_price: 3500, image: "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg")
      Item.create(title: 'raccoon', description: 'has little hands', unit_price: 40000, image: "raccoon.png")

      visit "/items"

      expect(page).to have_content("puppy")
      expect(page).to have_content("raccoon")
      expect(Item.count).to eq(2)

      first(:button, "Delete Item").click

      expect(page).to_not have_content("puppy")
      expect(page).to have_content("raccoon")
      expect(Item.count).to eq(1)
    end
  end
end
