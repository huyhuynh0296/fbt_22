class StaticPagesController < ApplicationController
  def home
    @tours = Tour.limit_tour 8
  end

  def help; end
end
