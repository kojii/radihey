class Button
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  belongs_to :button_image
  belongs_to :audio_file

  field :tag,  type: Integer
  field :text, type: String

  validates :tag, :text, :audio_file_id, presence: true

end
