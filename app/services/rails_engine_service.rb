# frozen_string_literal: true

require 'json'

class RailsEngineService
  def self.conn
    Faraday.new(
      url: 'http://localhost:3000'
    )
  end

  def self.merchants_index_endpoint
    response = conn.get('/api/v1/merchants')
    parse(response)
  end

  def self.merchant_items_endpoint(merchant_id)
    response = conn.get("/api/v1/merchants/#{merchant_id}/items")
    parse(response)
  end

  def self.merchant_details_endpoint(merchant_id)
    response = conn.get("/api/v1/merchants/#{merchant_id}")
    parse(response)
  end

  def self.items_index_endpoint
    response = conn.get('/api/v1/items')
    parse(response)
  end

  def self.item_show_endpoint(item_id)
    response = conn.get("api/v1/items/#{item_id}")
    parse(response)
  end

  def self.parse(api_data)
    JSON.parse(api_data.body,  symbolize_names: true)
  end

end