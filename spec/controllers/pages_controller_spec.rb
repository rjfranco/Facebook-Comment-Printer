require 'spec_helper'

describe PagesController do
  render_views
  
  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
    it "should have a field for the url" do
      get 'home'
      response.should have_selector('input[name=fburl]')
    end
  end

  describe "GET 'comments'" do
    it "should be successful" do
      get 'comments'
      response.should redirect_to('home')
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
  end

end
