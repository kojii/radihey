class ButtonImage
  include Mongoid::Document
  include Mongoid::Timestamps

  field :filename, type: String
  has_many :button

end
