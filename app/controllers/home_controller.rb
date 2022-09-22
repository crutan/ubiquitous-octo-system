# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @presentations = Presentation.active
  end
end
