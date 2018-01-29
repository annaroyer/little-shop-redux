describe "As a user" do
  describe "when I visit the categories page" do
    it "I can delete a category" do
      Category.create(name: "Mooing")

      visit "/categories"

      expect(page).to have_content("Mooing")

      click_on "Delete Category"

      expect(page).to_not have_content("Mooing")
      expect(Category.count).to eq(0)
    end
  end
end
