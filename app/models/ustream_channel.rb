class UstreamChannel < Channel
  field :url, type: String;
  validate :url, presence: true
end
