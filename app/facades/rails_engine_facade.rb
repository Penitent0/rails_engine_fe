class RailsEngineFacade < RailsEngineService 
  def self.merchants_index 
    merchants_index_endpoint[:data].map do |merchant|
      MerchantsIndexArray.new(merchant)
    end
  end

  def self.merchant_items(merchant_id)
    merchant_items_endpoint(merchant_id)[:data].map do |item|
      MerchantItems.new(item)
    end
  end

  def self.merchant_details(merchant_id)
    MerchantDetails.new(merchant_details_endpoint(merchant_id))
  end

  def self.items_index 
    items_index_endpoint[:data].map do |item|
      ItemsIndexArray.new(item)
    end
  end

  def self.item_show(item_id)
    ItemDetails.new(item_show_endpoint(item_id))
  end
end