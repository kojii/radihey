class ButtonSet
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :channel

  has_and_belongs_to_many :buttons,  inverse_of: nil
  field :name

  validates :name, :presence => true

end
