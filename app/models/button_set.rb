class ButtonSet
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :channel

  belongs_to :persona
  has_and_belongs_to_many :buttons

end
