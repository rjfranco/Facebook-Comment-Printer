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
    it "should redirect to the homepage" do
      get 'comments'
      response.should redirect_to(root_path)
      flash.now[:notice].should =~ /url/i
    end
  end
  
  describe "POST 'comments'" do
    describe "success" do
      before(:each) do
        # I Created this application with a co-worker here in mind, this could be any url with a associacted FB Object
        @attr = 'http://www.columbian.com/news/2011/jul/27/gop-spending-bill-threatens-to-gut-us-endangered-s/'
      end
      
      it "should render the title of the page request" do
        post 'comments', :fburl => @attr
        response.should have_selector('h2')
      end
      
      it "should render each comment" do
        post 'comments', :fburl => @attr
        response.should have_selector('.comments')
      end
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
  end

end
