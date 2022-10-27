require 'rails_helper'

RSpec.describe MerchantDetails do
  describe 'gets merchant details', vcr: { record: :new_episodes } do
    it 'instantiates' do
      expect(RailsEngineFacade.merchant_details(1)).to be_a(MerchantDetails)
    end

    it 'has merchant details' do
      merchant_1 = RailsEngineFacade.merchant_details(1)
      
      expect(merchant_1.name).to be_a(String)
      expect(merchant_1.id).to be_a(String)

      merchant_2 = RailsEngineFacade.merchant_details(2)
      
      expect(merchant_2.name).to be_a(String)
      expect(merchant_2.id).to be_a(String)
    end
  end
end