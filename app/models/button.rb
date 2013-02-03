class Button
  include Mongoid::Document
  include Mongoid::Timestamps

  field :se_url, type: String
  field :image_url, type: String

  embedded_in :channel

end
