class Channel
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :button_sets

  belongs_to :owner, class_name: User.to_s, :inverse_of => :channels

  field :title, type: String;
  field :description, type: String;

  validates :title, :description, presence: true

  def is_owned_by?(user)
    self.owner == user
  end
end
