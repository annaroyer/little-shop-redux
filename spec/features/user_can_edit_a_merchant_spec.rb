describe "as a user" do
  describe "when I go to merchant/index/id/edit" do
    it "I can edit an existing merchant" do
      visit "merchants/index/1/edit"

      fill_in "merchant[name]", with: "Sal My Savior"
      click_button "submit"

      expect(current_path).to eq("/merchants")
      expect(page).to have_content("Sal My Savior")
    end
  end
end
