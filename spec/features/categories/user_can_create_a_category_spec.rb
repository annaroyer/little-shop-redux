describe "As a user" do
  describe "when I go to the categories page" do
    it "I can create a new category" do
      visit '/categories'

      click_on "Create A Category"

      expect(current_path).to eq("/categories/new")


      fill_in "category[name]", with: "Mooing"
      
      click_button "Submit"

      expect(current_path).to eq("/categories")
      expect(page).to have_content("Mooing")
    end
  end
end
