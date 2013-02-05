class Button
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  belongs_to :owner, class_name: User.to_s, :inverse_of => :buttons
  belongs_to :button_image
  belongs_to :button_se

  field :name, type: String
  field :button_label, type: String

  validates :name, :button_label, presence: true

end
