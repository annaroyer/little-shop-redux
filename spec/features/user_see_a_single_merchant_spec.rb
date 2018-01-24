describe "As a user" do
  describe "when I search for a specific merchant" do
    it "I can see the single merchants ALL THE SINGLE MERCHANTS If you like it then you should've put a ring on it" do
      visit '/merchants/index/2'

      expect(page).to have_content("Beyonce")
    end
  end
end
