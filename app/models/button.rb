class Button
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  belongs_to :button_image
  belongs_to :button_se
  belongs_to :button_text

  field :name, type: String

  validates :name, :button_image_id, :button_se_id, :button_text_id, presence: true

end
