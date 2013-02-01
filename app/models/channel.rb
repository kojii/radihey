class Channel
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String;
  field :description, type: String;
  belongs_to :owner, class_name: User.to_s, :inverse_of => :channels

  validates :title, :description, presence: true
end
