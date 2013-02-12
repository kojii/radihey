class ButtonImage
  include Mongoid::Document
  include Mongoid::Timestamps

  field :filename, type: String
  field :name, type: String
  has_many :button

end
