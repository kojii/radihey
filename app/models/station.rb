class Station
  include Mongoid::Document
  include Mongoid::Timestamps
  has_many :radiko_channels, :dependent => :destroy

  field :code, type: String
  field :name, type: String

  validate :code, :name, presence: true
end
