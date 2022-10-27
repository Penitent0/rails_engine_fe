require 'rails_helper'

RSpec.describe ItemsIndexArray do
  describe 'gets array of item objects', vcr: { record: :new_episodes } do
    it 'instantiates' do
      RailsEngineFacade.items_index.each do |item|
        expect(item).to be_a(ItemsIndexArray)
      end
    end

    it 'has item details' do
      RailsEngineFacade.items_index.each do |item|
        expect(item.name).to be_a(String)
        expect(item.description).to be_a(String)
        expect(item.unit_price).to be_a(Float)
        expect(item.id).to be_a(String)
        expect(item.merchant_id).to be_a(Integer)
      end
    end
  end
end