describe "As a user" do
  describe "when I search for a specific category" do
    it "displays a single category" do
      Category.create(name: "Dying")

      visit '/categories/1'

      expect(page).to have_content("Dying")
    end
  end
end