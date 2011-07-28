class PagesController < ApplicationController
  def home
  end

  def comments
    if params[:fburl]
      @fburl = params[:fburl]
    else
      redirect_to root_path, :flash => { :notice => 'Please Provide a URL that contains facebook comments.' }
    end
  end

  def about
  end
end