describe "As a user" do
  context "when I visit '/'" do
    it "I can see a welcome message" do
      visit '/'

      expect(page).to have_content("items")
    end

    context "when I click on the merchant's link on the welcome page" do
      it 'I can see all the merchants' do
        visit '/'
        click_on "merchants"

        expect(current_path).to eq("/merchants")
      end
    end
  end
end
