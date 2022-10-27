require 'rails_helper'

RSpec.describe ItemDetails do
  describe 'gets item details', vcr: { record: :new_episodes } do
    it 'instantiates' do
      expect(RailsEngineFacade.item_show(4)).to be_a(ItemDetails)
    end

    it 'has item details' do
      item = RailsEngineFacade.item_show(4)

      expect(item.name).to be_a(String)
      expect(item.description).to be_a(String)
      expect(item.unit_price).to be_a(Float)
      expect(item.merchant_id).to be_a(Integer)
      expect(item.id).to be_a(String)
    end
  end
end