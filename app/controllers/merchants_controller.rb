class MerchantsController < ApplicationController 
  def index
    @merchants = RailsEngineFacade.merchants_index
  end

  def show
    @merchant = RailsEngineFacade.merchant_details(params[:id])
    @items = RailsEngineFacade.merchant_items(@merchant.id)
  end
end