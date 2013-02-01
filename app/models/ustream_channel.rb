class UstreamChannel < Channel
  field :ust_uid, type: String;
  validates :ust_uid, presence: true

  def embed_tag
    width = 480
    height = 300
    if json = open("http://api.ustream.tv/json/channel/#{self.ust_uid}/getCustomEmbedTag?key=#{Ustream::KEY}&params=autoplay:false;mute:false;height:#{height};width:#{width}").read
      begin
        result_obj = JSON.parse(json)
        return result_obj['results']
      rescue Exception => e
      end
    end
    return ''
  end

end
