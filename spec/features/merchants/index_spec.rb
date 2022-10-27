require 'rails_helper'

RSpec.describe 'Merchant Index' do
  # User Story - Merchants
  # As a visitor,
  # When I visit '/merchants'
  # I should see a list of merchants by name
  # and when I click the merchant's name
  # I should be on page '/merchants/:id'
  # And I should see a list of items that merchant sells.

  describe 'User Story - Merchants', vcr: { record: :new_episodes }do
    before :each do
      @merchants = RailsEngineFacade.merchants_index
      @items = RailsEngineFacade.merchant_items(@merchants.first.id)
    end
    it 'When I visit /merchants I should see a list of merchants by name' do
      visit merchants_path

      @merchants.each do |merchant|
        expect(page).to have_content(merchant.name)
      end
    end

    it 'and when I click the merchants name I should be on page /merchants/:id' do
      visit merchants_path

      @merchants.each do |merchant|
        expect(page).to have_link(merchant.name)
      end

      click_on "#{@merchants.first.name}"
      expect(current_path).to eq(merchant_path(@merchants.first.id))
    end

    it 'And I should see a list of items that merchant sells.' do
      visit merchant_path(@merchants.first.id)

      @items.each do |item|
        expect(page).to have_content(item.name)
      end
    end
  end
end