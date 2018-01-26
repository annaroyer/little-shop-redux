describe "Validations" do
    it "validates name" do
      Category.create(name: "Doyouwantmetotypeforyou").valid?
      Category.create(name: nil).valid?
    end
end

describe "As a user" do 
  describe "when I vist the category index page" do
    it "I can see all categories" do
      Category.create(name: "Doyouwantmetotypeforyou")
      Category.create(name: "Seriouslydoyouwantmetotypeforyou")
      Category.create(name: "Justgetoutoftheway")
      Category.create(name: "DoYoUWaNtMEtoTyPeFORyOu")

      visit "/categories"

      expect(page).to have_content("Doyouwantmetotypeforyou")
      expect(page).to have_content("Seriouslydoyouwantmetotypeforyou")
      expect(page).to have_content("Justgetoutoftheway")
      expect(page).to have_content("DoYoUWaNtMEtoTyPeFORyOu")
    end

    it "I can click on create a category" do
      visit '/categories'

      click_on "Create A Category"

      expect(current_path).to eq("/categories/new")
      # save_and_open_page
    end

    it "I can click on edit a category" do
      Category.create(name: "DoYoUWaNtMEtoTyPeFORyOu")

      visit '/categories'

      click_on "Edit Category"

      expect(current_path).to eq("/categories/1/edit")
      # save_and_open_page
    end

    it "I can click on delete a category" do
      Category.create(name: "DoYoUWaNtMEtoTyPeFORyOu")
      visit '/categories'

      click_on "Delete Category"

      expect(current_path).to eq("/categories")

    end

    it "I see one category" do
      Category.create(name: "Doyouwantmetotypeforyou")
    
      visit "/categories"

      click_on ""
      visit "/categories/:id"

      expect(page).to_not have_content(Doyouwantmetotypeforyou)
    end


  end
end