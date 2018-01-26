describe "As a user" do
  describe "when I visit /items" do
    it "I can delete a item" do
      Item.create(title: 'puppy', description: 'soft and fluffy', price: 35, image: "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg")
      visit "/items"

      expect(page).to have_content("puppy")

      click_on "Delete Item"

      expect(page).to_not have_content("puppy")
      expect(page).to have_content("Items")
      expect(Item.count).to eq(0)
    end
  end
end
