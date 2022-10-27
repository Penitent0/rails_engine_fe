require 'rails_helper' 

RSpec.describe 'Items Index' do
  # User Story - Items
  # As a visitor,
  # When I visit '/items'
  # I should see a list of items by name
  # and when I click the item's name
  # I should be on page '/items/:id'
  # And I should see the name of the item, description, and unit price.

  describe 'User Story - Items', vcr: { record: :new_episodes } do
    before :each do
      @items = RailsEngineFacade.items_index
    end
    it 'When I visit /items I should see a list of items by name' do
      visit items_path 

      expect(page).to have_content(@items.first.name)
      expect(page).to have_content(@items.second.name)
      expect(page).to have_content(@items.last.name)
    end

    it 'when I click the items name I should be on page /items/:id' do
      visit items_path 

      expect(page).to have_link(@items.first.name)
      expect(page).to have_link(@items.second.name)
      expect(page).to have_link(@items.last.name)

      click_on "#{@items.first.name}"

      expect(current_path).to eq(item_path(@items.first.id))

      visit items_path

      click_on "#{@items.third.name}"

      expect(current_path).to eq(item_path(@items.third.id))
    end

    it 'And I should see the name of the item, description, and unit price.' do
      visit item_path(@items.first.id)

      expect(page).to have_content(@items.first.name)
      expect(page).to have_content(@items.first.description)
      expect(page).to have_content(@items.first.unit_price)

      visit item_path(@items.last.id)

      expect(page).to have_content(@items.last.name)
      expect(page).to have_content(@items.last.description)
      expect(page).to have_content(@items.last.unit_price)
    end
  end
end