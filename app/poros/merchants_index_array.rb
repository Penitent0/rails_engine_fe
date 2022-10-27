class MerchantsIndexArray
  attr_reader :id,
              :type,
              :name 

  def initialize(api)
    @id = api[:id]
    @type = api[:type]
    @name = api[:attributes][:name]
  end
end