class AudioFile
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  has_many :buttons, dependent: :destroy

  has_mongoid_attached_file :audio, {
    :path           => '/:attachment/:id/:filename',
    :storage        => :s3,
    :url            => ':s3_alias_url',
    :s3_host_alias  => S3::HOST,
    :s3_credentials => File.join(Rails.root, 'config', 's3.yml')
  }

  #validates_attachment :audio, :presence => true, :size => {:in => 0..1.megabytes}
  #validates_attachment_content_type :audio, :content_type => /audio\/(x-)?wav/

  def as_json(options = {})
    super(:methods => [:audio])
  end

end
