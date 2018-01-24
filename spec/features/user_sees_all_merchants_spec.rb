describe "As a user" do
  describe "when I visit merchants index page" do
    it "I can see all merchants" do
      visit '/merchants/index'

      expect(page).to have_content("Merchant")
    end
  end
end
