class ConcertsController < ApplicationController
  def index
    @concerts = Concert.order(date: :asc)
  end

  def show
    @concert = Concert.find(params[:id])
  end
end
