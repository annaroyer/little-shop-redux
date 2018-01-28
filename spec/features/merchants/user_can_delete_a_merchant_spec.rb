describe "As a user" do
  describe "when I visit /merchants" do
    it "I can delete a merchant" do
      Merchant.create(name: "JEFFroy")
      visit "/merchants"

      expect(page).to have_content("JEFFroy")

      click_on "Delete Merchant"

      expect(page).to_not have_content("JEFFroy")
      expect(page).to have_content("Merchants")
      expect(Merchant.count).to eq(0)
    end
  end
end
