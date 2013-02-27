class ButtonSe
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  has_many :buttons

  field :name,  type: String
  has_mongoid_attached_file :audio, {
    :path           => '/button_se/:attachment/:id/:filename',
    :storage        => :s3,
    :url            => ':s3_alias_url',
    :s3_credentials => File.join(Rails.root, 'config', 's3.yml')
  }

  validates :name, presence: true
  validates_attachment :audio, presence: true, size: {in: 0..1.megabytes}
  validates_attachment_content_type :audio, :content_type => /audio\/(x-)?wav/
end
