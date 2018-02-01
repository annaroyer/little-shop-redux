describe "As a user" do
  describe "when I go to the item index page" do
    it "I can create a new item" do
      Merchant.create(name: 'cutesockz4987')

      visit '/items/new'

      fill_in "item[title]", with: "puppy"
      fill_in "item[description]", with: "soft and fluffy"
      fill_in "item[unit_price]", with: 35.00
      fill_in "item[image]", with: "http://tinypuppy.png"
      within first('optgroup') do
        select("cutesockz4987")
      end

      click_button "Create"

      expect(current_path).to eq("/items/1")
      expect(page).to have_content("puppy")
      expect(Item.count).to eq(1)
    end
  end
end
