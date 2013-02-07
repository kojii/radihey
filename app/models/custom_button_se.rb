class CustomButtonSe < ButtonSe
  include Mongoid::Paperclip

  belongs_to :owner, class_name: User.to_s

  has_mongoid_attached_file :uploaded_audio, {
    :path           => '/button_se/:attachment/:id/:filename',
    :storage        => :s3,
    :url            => ':s3_alias_url',
    :s3_host_alias  => 'radiheyrails-kari.s3.amazonaws.com',
    :s3_credentials => File.join(Rails.root, 'config', 's3.yml')
  }

  validates_attachment :uploaded_audio, presence: true,
    content_type: {content_type: ['audio/x-wav']},
    size: {in: 0..1.megabytes}

  def audio
    self.uploaded_audio
  end
end
