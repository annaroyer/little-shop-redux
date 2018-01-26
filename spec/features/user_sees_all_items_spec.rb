describe "As a user" do 
  describe "when I vist the items index page" do
    it "I can see all items" do
      Item.create(name: "Doyouwantmetotypeforyou")

      visit "/items"

      expect(page).to have_content("Doyouwantmetotypeforyou")
    end
    
  end
end