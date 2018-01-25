describe "As a user" do
  describe "when I visit merchants index page" do
    it "I can see all merchants" do
      Merchant.create(name: "Opakawagalaga")
      Merchant.create(name: "Opakawagalaga")
      Merchant.create(name: "Opakawagalaga")
      Merchant.create(name: "Opakawagalaga")
      Merchant.create(name: "Opakawagalaga")
      visit "/merchants/index"

      expect(page).to have_content("Opakawagalaga")
    end

    it "I can click on new merchant" do
      Merchant.create(name: "Opakawagalaga")
      visit "/merchants/index"
      binding.pry
      click_on "New Merchant"

      expect(current_path).to eq("/merchants/index/new")
    end

    it "I can click on edit a merchant" do
      Merchant.create(name: "Opakawagalaga")
      visit "/merchants/index"
      click_on "Edit Merchant"

      expect(current_path).to eq("/merchants/index/1/edit")
    end

    it "I can click on delete a merchant" do
      Merchant.create(name: "Opakawagalaga Epunifahorious")
      visit "/merchants/index"
      click_on "Delete Merchant"

      expect(current_path).to eq("/merchants/index/1/delete")
    end

    it "I can find a merchant by name" do
      Merchant.create(name: "Opakawagalaga")
      visit "/merchants/index"
      fill_in "merchants[name]", with: "Opakawagalaga"
      click_button "Find"

      expect(current_path).to eq("/merchants/index/show")
    end
  end
end
