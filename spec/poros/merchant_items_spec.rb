require 'rails_helper'

RSpec.describe MerchantItems do
  describe 'get merchant items', vcr: { record: :new_episodes } do
    it 'instantiates' do
      RailsEngineFacade.merchant_items(1).each do |item|
        expect(item).to be_a(MerchantItems)
      end
    end

    it 'has item details' do
      RailsEngineFacade.merchant_items(1).each do |item|
        expect(item.name).to be_a(String)
        expect(item.description).to be_a(String)
        expect(item.unit_price).to be_a(Float)
        expect(item.id).to be_a(String)
        expect(item.merchant_id).to be_a(Integer)
      end 
    end
  end
end