describe "As a user" do
  describe "when I visit merchants index page" do
    it "I can see all merchants" do
      Merchant.create(name: "Opakawagalaga")
      Merchant.create(name: "Opakawagalaga")
      Merchant.create(name: "Opakawagalaga")
      Merchant.create(name: "Opakawagalaga")
      Merchant.create(name: "Opakawagalaga")
      visit "/merchants"

      expect(page).to have_content("Opakawagalaga")
    end

    it "I can click on new merchant" do
      visit "/merchants"
      click_on "New Merchant"

      expect(current_path).to eq("/merchants/new")
    end

    it "I can click on edit a merchant" do
      Merchant.create(name: "Opakawagalaga")
      visit "/merchants"
      click_on "Edit Merchant"

      expect(current_path).to eq("/merchants/1/edit")
    end

    it "I can click on delete a merchant" do
      Merchant.create(name: "Opakawagalaga Epunifahorious")
      visit "/merchants"
      click_on "Delete Merchant"

      expect(current_path).to eq("/merchants")
    end

    it "I can find a merchant by name" do
      Merchant.create(name: "Opakawagalaga")
      visit "/merchants"
      fill_in "merchants[name]", with: "Opakawagalaga"
      click_button "Find"

      expect(current_path).to eq("/merchants/1")
    end
  end
end
