describe "as a user" do
  context "when I visit '/'" do
    it "I see a welcome message" do
      visit '/'

      expect(page).to have_content("Welcome")
    end

    it "I can click on the merchant's link on the welcome page" do
      
      visit '/'
      click_on "ALL THE MERCHANTS"

      expect(current_path).to eq("/merchants")
    end
  end
end
