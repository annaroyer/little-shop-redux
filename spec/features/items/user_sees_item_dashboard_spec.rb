describe 'As a user' do
  describe 'When I visit the items dashboard page' do
    it 'I can see the total number of items' do
      Item.create(title: 'puppy', description: 'soft and fluffy', unit_price: 5500, image: "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg")
      Item.create(title: 'raccoon', description: 'has little hands', unit_price: 5500, image: "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg")
      Item.create(title: 'kitty', description: 'pointy ears', unit_price: 5500, image: "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg")

      visit '/items-dashboard'

      expect(page).to have_content("Total Items: 3")
    end

    it 'I can see the average price per item' do
      Item.create(title: 'puppy', description: 'soft and fluffy', unit_price: 2500, image: "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg")
      Item.create(title: 'raccoon', description: 'has little hands', unit_price: 5500, image: "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg")
      Item.create(title: 'kitty', description: 'pointy ears', unit_price: 4000, image: "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg")

      visit '/items-dashboard'

      expect(page).to have_content("Average Price Per Item: $40")
    end

    it 'I can see the most recently created item' do
      Item.create(title: 'puppy', description: 'soft and fluffy', unit_price: 5500, image: "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg")
      Item.create(title: 'raccoon', description: 'has little hands', unit_price: 5500, image: "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg")
      Item.create(title: 'kitty', description: 'pointy ears', unit_price: 5500, image: "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg")

      visit '/items-dashboard'

      expect(page).to have_content("Most Recently Created Item: kitty")
    end

    it 'I can see the oldest item' do
      Item.create(title: 'puppy', description: 'soft and fluffy', unit_price: 5500, image: "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg")
      Item.create(title: 'raccoon', description: 'has little hands', unit_price: 5500, image: "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg")
      Item.create(title: 'kitty', description: 'soft and fluffy', unit_price: 5500, image: "https://i.pinimg.com/564x/39/f0/5f/39f05f7c2df0d2d5eec301a32c8fb38a.jpg")

      visit '/items-dashboard'

      expect(page).to have_content("Oldest Item: puppy")
    end
  end
end
