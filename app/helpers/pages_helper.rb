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
    comments = ""
    
    fbresult[thisurl]['data'].each do |data|
      name = data['from']['name']
      message = data['message']
      
      comments += "    <li>\n"
      comments += "      <h4>#{name}"
      unless data['likes'].nil?
        likes = data['likes']
        comments += " <span>| Likes [#{likes}]</span>"
      end
      comments += "</h4>\n"
      comments += "      <p>#{message}</p>\n"

      unless data['comments'].nil?
        comments += "      <ul>\n"
        data['comments']['data'].each do |comment|
          name = comment['from']['name']
          message = comment['message']
          
          comments += "        <li>\n"
          comments += "          <h4>#{name}</h4>\n"
          comments += "          <p>#{message}</p>\n"
          comments += "        </li>\n"
        end
        comments += "      </ul>\n"
      end

      comments += "    </li>\n"
    end

    return comments
  end

  def get_document_from_facebook_for(thisurl)
    thisurl = 'http://graph.facebook.com/comments/?ids=' + thisurl
    response = Net::HTTP.get_response(URI.parse(thisurl))
    return response.body
  end
end
