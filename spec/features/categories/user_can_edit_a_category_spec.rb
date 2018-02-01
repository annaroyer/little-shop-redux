describe "As a user" do
  describe "when I visit the categories page" do
    it "I can edit an existing category" do
      Category.create(name: "Dying")

      visit "categories"

      click_on "Edit"

      expect(current_path).to eq("/categories/1/edit")

      fill_in "category[name]", with: "Running"

      click_button "Edit"

      expect(current_path).to eq("/categories/1")
      expect(page).to have_content("Running")
    end
  end
end
