require 'rails_helper'

RSpec.describe MerchantsIndexArray do
  describe 'get merchants index array', vcr: { record: :new_episodes } do
    it 'instantiates' do
      expect(RailsEngineFacade.merchants_index).to be_a(Array)
      RailsEngineFacade.merchants_index.each do |merchant|
        expect(merchant).to be_a(MerchantsIndexArray)
      end
    end

    it 'has merchant details' do
      @merchants = RailsEngineFacade.merchants_index

      @merchants.each do |merchant|
        expect(merchant.name).to be_a(String)
        expect(merchant.id).to be_a(String)
      end
    end
  end
end