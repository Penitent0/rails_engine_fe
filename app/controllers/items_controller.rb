class ItemsController < ApplicationController
  def show
    @item = RailsEngineFacade.item_show(params[:id])
  end
end