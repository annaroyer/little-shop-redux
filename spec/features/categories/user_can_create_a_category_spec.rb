describe "As a user" do
  describe "when I go to the categories page" do
    it "I can create a new category" do
      visit '/categories/new'

      fill_in "category[name]", with: "Mooing"
      click_button "Create"

      expect(current_path).to eq("/categories/1")
      expect(page).to have_content("Mooing")
      expect(Category.count).to eq(1)
    end
  end
end
