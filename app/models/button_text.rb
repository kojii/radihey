class ButtonText
  include Mongoid::Document
  include Mongoid::Timestamps

  has_one :button

  field :text, type: String

  validates :text, presence: true
end
