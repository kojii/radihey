class ValidUstreamUrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    err_flag = false
    unless /^http:\/\/www\.ustream\.tv\/channel\/([^\/]+).*/ =~ record.url
      err_flag = true
    end
    unless record.embed_tag
      err_flag = true
    end
    if err_flag
      record.errors[attribute] << I18n.t('custom_validation.invalid_url')
    end
  end
end

class UstreamChannel < Channel
  field :url, type: String;
  validates :url, presence: true
  validates :url, valid_ustream_url: true

  def embed_tag
    width = 480
    height = 300

    /^http:\/\/www\.ustream\.tv\/channel\/([^\/]+).*/ =~ self.url
    ust_uid = $1

    unless json = open("http://api.ustream.tv/json/channel/#{ust_uid}/getCustomEmbedTag?key=#{Ustream::KEY}&params=autoplay:false;mute:false;height:#{height};width:#{width}").read
      return nil
    end

    begin
      result_obj = JSON.parse(json)
      return result_obj['results']
    rescue Exception => e
      return nil
    end
  end

end
