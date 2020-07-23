class WelcomeController < ApplicationController
  def index
    @name = params[:name]
    @course = params[:course]
  end
end
