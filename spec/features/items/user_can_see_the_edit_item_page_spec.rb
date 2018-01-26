describe "User can see an edit item page" do
  context "as a user, when I visit the items/id/edit" do
    it "I can see the edit item form" do
      Item.create(title: "Raccoon", description: "has little hands", price: 55, image: "https://www.thehairpin.com/wp-content/uploads/2017/03/1wYG6HNTzkxiI3FA0sDwF9g.jpeg")
      visit "items/1/edit"

      expect(page).to have_content("Edit Item")
    end
  end
end
