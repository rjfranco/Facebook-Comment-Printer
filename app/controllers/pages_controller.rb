class PagesController < ApplicationController
  def home
  end

  def comments
    if params[:fburl] then
    else
      redirect_to root_path
    end
  end

  def about
  end

end
