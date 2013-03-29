class ButtonImage
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  has_many :buttons, :dependent => :destroy

  field :name, type: String
  has_mongoid_attached_file :image, {
    :path           => '/button_image/:attachment/:id/:filename',
    :storage        => :s3,
    :url            => ':s3_alias_url',
    :s3_host_alias  => S3::HOST,
    :s3_credentials => File.join(Rails.root, 'config', 's3.yml')
  }
  has_mongoid_attached_file :image_clicked, {
    :path           => '/button_image/:attachment/:id/:filename',
    :storage        => :s3,
    :url            => ':s3_alias_url',
    :s3_host_alias  => S3::HOST,
    :s3_credentials => File.join(Rails.root, 'config', 's3.yml')
  }

  validates :name, presence: true
  validates_attachment :image, :image_clicked, presence: true, size: {in: 0..1.megabytes}
  validates_attachment_content_type :image, :image_clicked, :content_type => /image\/*/
end
