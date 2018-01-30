describe "User can see an edit merchant page" do
  context "as a user, when I visit the merchants/id/edit" do
    it "I can see the edit merchant form" do
      Merchant.create(name: "Benny")
      visit "merchants/1/edit"

      expect(page).to have_content("Edit Merchant")
    end
  end
end
