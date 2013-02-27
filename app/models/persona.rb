class Persona
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :button_ses

  field :name, type: String

  validates :name, presence: true
end
