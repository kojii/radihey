class ButtonSe
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name,  type: String
  field :audio, type: String, default: 'button_hee'
  has_many :buttons

  validates :name, presence: true
end
