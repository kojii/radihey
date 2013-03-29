class DefaultButtonSet
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  has_and_belongs_to_many :buttons, inverse_of: nil

  validates :name, :presence => true

end
