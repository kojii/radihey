class Button
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  belongs_to :button_image
  belongs_to :button_se
  has_and_belongs_to_many :channels

  field :name, type: String
  field :button_label, type: String

  validates :name, :button_label, :button_image_id, :button_se_id, presence: true

end
