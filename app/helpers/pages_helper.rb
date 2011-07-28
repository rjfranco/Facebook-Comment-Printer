module PagesHelper
  def get_title_for(thisurl)
    agent = Mechanize.new
    agent.user_agent_alias = 'Mac Safari'
    agent.get(thisurl).title
  end
  
  def get_comments_for(thisurl)
    
  end
  
  def get_json_from_facebook_for(thisurl)
  end
end
