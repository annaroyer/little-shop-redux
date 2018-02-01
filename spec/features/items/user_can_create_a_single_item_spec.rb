describe "As a user" do
  describe "when I go to the item index page" do
    it "I can create a new item" do
      Merchant.create(name: 'cutesockz4987')
      Category.create(name: 'animal clothing')

      visit '/items/new'

      fill_in "item[title]", with: "puppy"
      fill_in "item[description]", with: "soft and fluffy"
      fill_in "item[unit_price]", with: 35.00
      fill_in "item[image]", with: "http://tinypuppy.png"

      click_button "Create"

      expect(current_path).to eq("/items/1")
      expect(page).to have_content("puppy")
      expect(Item.count).to eq(1)
    end
  end
end
