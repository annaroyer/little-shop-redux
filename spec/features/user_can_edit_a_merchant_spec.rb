describe "as a user" do
  describe "when I go to merchant/id/edit" do
    it "I can edit an existing merchant" do
      Merchant.create(name: 'Sal')
      visit "merchants/1/edit"

      fill_in "merchant[name]", with: "Sal My Savior"
      click_button "Submit"

      expect(current_path).to eq("/merchants/1")
      expect(page).to have_content("Sal My Savior")
    end
  end
end
