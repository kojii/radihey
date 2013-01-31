class UstreamChannel < Channel
  field :ust_uid, type: String;
  validate :ust_uid, presence: true

  def embed_tag
    if json = open("http://api.ustream.tv/json/channel/#{self.ust_uid}/getEmbedTag?key=#{Ustream::KEY}").read
      begin
        result_obj = JSON.parse(json)
        result_obj['results']
      rescue Exception => e
      end
    end
  end

end
