class HomeController < ApplicationController
  def index
    @presentations = Presentation.active
  end
end
