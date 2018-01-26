describe "As a user" do 
  describe "when I vist the category index page" do
    it "I can see all categories" do
      Category.create(name: "Doyouwantmetotypeforyou")

      visit "/category"

      expect(page).to have_content("Doyouwantmetotypeforyou")
    end

  end
end