module PagesHelper
  class Comment
    attr_accessor :name, :message, :likes, :parent
  end
  
  def get_title_for(thisurl)
    agent = Mechanize.new
    agent.user_agent_alias = 'Mac Safari'
    return agent.get(thisurl).title
  end

  def get_comments_for(thisurl)
    commentobject = get_document_from_facebook_for(thisurl)
    fbresult = JSON.parse(commentobject)
    
    fbresult[thisurl]['data'].each do |data|
      
      comment = []
      comment.name = data['from']['name']
      comment.message = data['message']
    end

    return comments
  end

  def get_document_from_facebook_for(thisurl)
    thisurl = 'http://graph.facebook.com/comments/?ids=' + thisurl
    response = Net::HTTP.get_response(URI.parse(thisurl))
    return response.body
  end
end
