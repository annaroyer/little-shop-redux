describe "As a user" do
  describe "when I go to item/id/edit" do
    it "I can edit an existing item" do
      Item.create(title: 'puppy', description: 'soft and fluffy', unit_price: 3500, image: "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg")
      visit "items/1/edit"

      fill_in "item[title]", with: "raccoon"
      fill_in "item[description]", with: "has little hands"
      fill_in "item[unit_price]", with: 55.00
      fill_in "item[image]", with: "http://fluffyraccoon.png"
      click_button "Submit"

      expect(current_path).to eq("/items/1")
      expect(page).to have_content("raccoon")
    end
  end
end
