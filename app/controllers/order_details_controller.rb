class OrderDetailsController < ApplicationController
  def index
    @tours = Tour.all
  end
end
