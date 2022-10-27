class MerchantDetails
  attr_reader :id,
              :name

  def initialize(api)
    @id = api[:data][:id]
    @name = api[:data][:attributes][:name]
  end
end