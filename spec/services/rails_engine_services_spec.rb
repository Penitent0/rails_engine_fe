require 'rails_helper'

RSpec.describe RailsEngineService do
  describe 'rails engine api services', vcr: { record: :new_episodes } do
    it 'instantiates' do
      services = RailsEngineService.new
      expect(services).to be_a(RailsEngineService)
    end

    it 'gets merchants index endpoint as a hash containing array of merchant details as hashes' do
      response = RailsEngineService.merchants_index_endpoint
      
      expect(response).to be_a(Hash)
      expect(response[:data]).to be_a(Array)
      expect(response[:data][0]).to be_a(Hash)
    end

    it 'gets specified merchant items endpoint as a hash containing array of item details as hashes' do
      response = RailsEngineService.merchant_items_endpoint(1)

      expect(response).to be_a(Hash)
      expect(response[:data]).to be_a(Array)
      expect(response[:data][0]).to be_a(Hash)
      expect(response[:data][0][:attributes]).to be_a(Hash)
      expect(response[:data][0][:attributes][:name]).to be_a(String)
      expect(response[:data][0][:attributes][:unit_price]).to be_a(Float)
    end

    it 'gets specified merchant details endpoint as a hash containing merchant details as a nested hash' do
      response = RailsEngineService.merchant_details_endpoint(1)

      expect(response).to be_a(Hash)
      expect(response[:data][:id]).to be_a(String)
      expect(response[:data][:attributes]).to be_a(Hash)
      expect(response[:data][:attributes][:name]).to be_a(String)
    end

    it 'gets items index endpoint as a hash containing array of items details as hashes' do
      response = RailsEngineService.items_index_endpoint

      expect(response).to be_a(Hash)
      expect(response[:data]).to be_a(Array)
      expect(response[:data][0]).to be_a(Hash)
    end

    it 'gets specified item details endpoint as hash containing item details as a nested hash' do
      response = RailsEngineService.item_details_endpoint(4)

      expect(response).to be_a(Hash)
      expect(response[:data][:id]).to be_a(String)
      expect(response[:data][:attributes]).to be_a(Hash)
      expect(response[:data][:attributes][:name]).to be_a(String)
      expect(response[:data][:attributes][:unit_price]).to be_a(Float)
      expect(response[:data][:attributes][:merchant_id]).to be_a(Integer)
    end
  end
end