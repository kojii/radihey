class ValidUstreamUidValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless record.embed_tag
      record.errors[attribute] << I18n.t('custom_validation.invalid_ust_uid')
    end
  end
end

class UstreamChannel < Channel
  field :ust_uid, type: String;
  validates :ust_uid, presence: true
  validates :ust_uid, valid_ustream_uid: true

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
  end

end
