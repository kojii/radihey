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
    :s3_host_alias  => 'radiheyrails.s3.amazonaws.com',
    :s3_credentials => File.join(Rails.root, 'config', 's3.yml')
  }

  validates :name, presence: true
  validates_attachment :audio, presence: true,
    content_type: {content_type: ['audio/wav','audio/x-wav']},
    size: {in: 0..1.megabytes}
end
