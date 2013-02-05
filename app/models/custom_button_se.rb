class CustomButtonSe < ButtonSe
  include Mongoid::Paperclip

  has_mongoid_attached_file :uploaded_audio, {
    :path           => '/button/:attachment/:id/:filename',
    :storage        => :s3,
    :url            => ':s3_alias_url',
    :s3_host_alias  => 'radihey123.s3.amazonaws.com',
    :s3_credentials => File.join(Rails.root, 'config', 's3.yml')
  }

  validates :uploaded_audio, presence: true
  validates_attachment_content_type :audio, :content_type => ['audio/wav', 'audio/mpeg', 'audio/x-mpeg']

  def audio
    self.uploaded_audio
  end
end
