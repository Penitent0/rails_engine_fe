class ItemDetails
  attr_reader :id,
              :name,
              :description,
              :unit_price

  def initialize(api)
    @id = api[:data][:id]
    @name = api[:data][:attributes][:name]
    @description = api[:data][:attributes][:description]
    @unit_price = api[:data][:attributes][:unit_price]
  end
end