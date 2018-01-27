describe "Validations" do
  it "validates name" do
    Category.create(name: "Doyouwantmetotypeforyou").valid?
    Category.create(name: nil).valid?
  end
end
