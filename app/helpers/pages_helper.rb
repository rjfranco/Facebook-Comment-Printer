module PagesHelper
  def get_title_for(thisurl)
    agent = Mechanize.new
    agent.user_agent_alias = 'Mac Safari'
    agent.get(thisurl).title
  end
end
