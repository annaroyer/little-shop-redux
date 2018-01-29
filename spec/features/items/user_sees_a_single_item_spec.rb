describe "As a user" do
  describe "when I search for a specific item" do
    it "I can see that single item" do
      Item.create(title: "Raccoon", description: "has little hands", unit_price: 5500, image: "https://www.thehairpin.com/wp-content/uploads/2017/03/1wYG6HNTzkxiI3FA0sDwF9g.jpeg")
      Item.create(title: "Raccoon", description: "has little hands", unit_price: 5500, image: "https://www.thehairpin.com/wp-content/uploads/2017/03/1wYG6HNTzkxiI3FA0sDwF9g.jpeg")
      Item.create(title: "Raccoon", description: "has little hands", unit_price: 5500, image: "https://www.thehairpin.com/wp-content/uploads/2017/03/1wYG6HNTzkxiI3FA0sDwF9g.jpeg")

      visit '/items/2'

      expect(page).to have_content("Raccoon")
    end
  end
end
