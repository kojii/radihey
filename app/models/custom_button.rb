class CustomButton < Button
  include Mongoid::Paperclip

  has_mongoid_attached_file :custom_se, {
    :path           => ':attachment/:id/:filename',
    :storage        => :s3,
    :url            => ':s3_alias_url',
    :s3_host_alias  => 'radihey123.s3.amazonaws.com',
    :s3_credentials => File.join(Rails.root, 'config', 's3.yml')
  }
  has_mongoid_attached_file :custom_image, {
    :path           => ':attachment/:id/:filename/:style',
    :storage        => :s3,
    :url            => ':s3_alias_url',
    :s3_host_alias  => 'radihey123.s3.amazonaws.com',
    :s3_credentials => File.join(Rails.root, 'config', 's3.yml'),
    :styles => {
      :normal => ['200x200>', :png],
      :thumbnail => ['80x80', :png]
    },
    :convert_options => { :all => '-background white -flatten +matte -auto-orient' }
  }

  validates_attachment_content_type :se, :content_type => ['audio/wav', 'audio/mpeg', 'audio/x-mpeg']
  validates_attachment_content_type :image, :content_type => ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/png', 'image/gif']

  def se_url
    self.custom_se.url
  end

  def image_url
    self.custom_image.url
  end
end
