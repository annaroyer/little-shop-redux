describe Merchant do
  describe "Validations" do
    it "is invalid without a name" do
      merchant = Merchant.create

      expect(merchant).to be_invalid
    end
  end
end
