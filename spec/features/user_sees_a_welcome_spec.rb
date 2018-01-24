describe "as a user" do
  context "when I visit '/'" do
    it "I see a welcome message" do
      visit '/'

      expect(page).to have_content("Welcome")
    end
  end
end
