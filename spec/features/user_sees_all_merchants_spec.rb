describe "As a user" do
  describe "when I visit merchants index page" do
    it "I can see all merchants" do
      Merchant.create(name: "Opakawagalaga")
      Merchant.create(name: "Opakawagalaga")
      Merchant.create(name: "Opakawagalaga")
      Merchant.create(name: "Opakawagalaga")
      Merchant.create(name: "Opakawagalaga")
      visit '/merchants/index'

      expect(page).to have_content("Opakawagalaga")
    end
  end
end
