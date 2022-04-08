class HomesController < ApplicationController
  def top
    @cafes=Cafe.all
    @beans=Bean.all
  end
end
