class MerchantItems
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id

  def initialize(api)
    @id = api[:id]
    @name = api[:attributes][:name]
    @description = api[:attributes][:description]
    @unit_price = api[:attributes][:unit_price]
    @merchant_id = api[:attributes][:merchant_id]
  end
end