require 'rails_helper'

RSpec.describe RailsEngineFacade do
  describe 'rails engine facade', vcr: { record: :new_episodes } do
    it 'instantiates' do
      facade = RailsEngineFacade.new
      expect(facade).to be_a(RailsEngineFacade)
    end

    it 'instantiates array of merchant objects' do
      merchants = RailsEngineFacade.merchants_index 

      expect(merchants).to be_a(Array)

      merchants.each do |merchant|
        expect(merchant.name).to be_a(String)
        expect(merchant.id).to be_a(String)
      end
    end

    it 'instantiates arrays of merchant items objects' do
      items = RailsEngineFacade.merchant_items(1)

      expect(items).to be_a(Array)

      items.each do |item|
        expect(item.name).to be_a(String)
        expect(item.description).to be_a(String)
        expect(item.unit_price).to be_a(Float)
        expect(item.id).to be_a(String)
        expect(item.merchant_id).to be_a(Integer)
        expect(item.merchant_id).to eq(1)
      end
    end

    it 'instantiates merchant details object' do
      merchant =  RailsEngineFacade.merchant_details(1)

      expect(merchant.name).to be_a(String)
      expect(merchant.id).to be_a(String)
      expect(merchant.id).to eq("1")
    end

    it 'instantiates an array of item objects' do
      items =  RailsEngineFacade.items_index

      items.each do |item|
        expect(item.name).to be_a(String)
        expect(item.description).to be_a(String)
        expect(item.unit_price).to be_a(Float)
        expect(item.id).to be_a(String)
        expect(item.merchant_id).to be_a(Integer)
      end
    end

    it 'instantiates item details object' do
      item =  RailsEngineFacade.item_show(4)


      expect(item.name).to be_a(String)
      expect(item.description).to be_a(String)
      expect(item.unit_price).to be_a(Float)
      expect(item.merchant_id).to be_a(Integer)
      expect(item.id).to be_a(String)
      expect(item.id).to eq("4")
    end
  end
end