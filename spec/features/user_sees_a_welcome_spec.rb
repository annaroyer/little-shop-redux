describe "As a user" do
  context "when I visit '/'" do
    it "I can see a welcome message" do
      Merchant.create(name: 'Billy Jean')

      visit '/'

      expect(page).to have_content("items")
      expect(page).to have_content("merchants")
      expect(page).to have_content("categories")
    end

    context "when I click on the merchant's link on the welcome page" do
      it 'I can see all the merchants' do
        Merchant.create(name: 'Annie')

        visit '/'

        click_on "merchants"

        expect(current_path).to eq("/merchants")
      end
    end

    context "when I click on the item's link on the welcome page" do
      it 'I can see all the items' do
        Item.create(title: 'Aladdin', description: 'VHS tape', unit_price: 4000, image: 'magic-carpet.jpg')

        visit '/'

        click_on "items"

        expect(current_path).to eq("/items")
      end
    end


    context "when I click on the categorie's link on the welcome page" do
      it 'I can see all the categories' do
        Category.create(name: 'collection items')

        visit '/'

        click_on "categories"

        expect(current_path).to eq("/categories")
      end
    end
  end
end
