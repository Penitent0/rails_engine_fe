class ItemsController < ApplicationController
  def index
    @items = RailsEngineFacade.items_index 
  end
  def show
    @item = RailsEngineFacade.item_details(params[:id])
  end
end