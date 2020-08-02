class WelcomeController < ApplicationController
  def index
    flash.now[:error] = "Booo!!!"
    cookies[:course] = "Curso de Ruby on Rails [COOKIE]"
    session[:course] = "Curso de Ruby on Rails [SESSION]"
    @name = params[:name]
    @course = params[:course]
  end
end
