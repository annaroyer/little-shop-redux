describe "As a user" do
  describe "when I visit merchants-dashboard" do
    it "I can see the merchant with the most items" do
      Merchant.create(name: "Opakawaganaga")
      Merchant.create(name: "Henry. Poor Henry")
      Item.create()
      Item.create()
      Item.create()
      visit "/merchants-dashboard"

      expect(page).to have_content("Opakawaganaga")
      expect(page).to_not have_content("Henry. Poor Henry")
    end

    it "I can see the merchant with the highest priced item" do
      Merchant.create(name: "Opakawaganaga")
      Merchant.create(name: "Henry. Poor Henry")
      Item.create()
      Item.create()
      Item.create()
      visit "/merchants-dashboard"

      expect(page).to have_content("Opakawaganaga")
      expect(page).to_not have_content("Henry. Poor Henry")
    end

    describe "I can see a breakdown of each merchant" do
      it "with the total number of items" do
        Merchant.create(name: "Opakawaganaga")
        Item.create()
        Item.create()
        Item.create()
        visit "/merchants-dashboard"

        expect(page).to have_content("3")
      end

      it "with the total price for all items" do
        Merchant.create(name: "Opakawaganaga")
        Item.create()
        Item.create()
        Item.create()
        visit "/merchants-dashboard"

        expect(page).to have_content("UNITPRICESTANDIN")
      end
    end
  end
end
