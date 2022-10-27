class ItemDetails
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id

  def initialize(api)
    @id = api[:data][:id]
    @name = api[:data][:attributes][:name]
    @description = api[:data][:attributes][:description]
    @unit_price = api[:data][:attributes][:unit_price]
    @merchant_id = api[:data][:attributes][:merchant_id]
  end
end