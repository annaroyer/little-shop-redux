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
      Merchant.create(name: "Opakawagalaga")

      visit "/merchants"

      click_on "New Merchant"

      expect(current_path).to eq("/merchants/new")
    end

    it "I can click on edit a merchant" do
      Merchant.create(name: "Opakawagalaga")

      visit "/merchants"

      within(".utility") do
        first(:button, "Edit").click
      end

      expect(current_path).to eq("/merchants/1/edit")
    end

    it "I can click on delete a merchant" do
      Merchant.create(name: "Opakawagalaga Epunifahorious")
      Merchant.create(name: "Opakawagalaga")


      visit "/merchants"

      within first(".utility") do
        first(:button, "Delete").click
      end

      expect(current_path).to eq("/merchants")
    end
  end
end
