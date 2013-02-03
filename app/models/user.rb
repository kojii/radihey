class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Authenticable
  include AASM

  field :pre_register_token, type: String
  field :status
  aasm :column => :status do
    state :created, initial: true # ユーザのデータが作られた直後の状態
    state :pre_registered # 仮登録した状態
    state :activated # 有効化された状態
    state :leaved # 退会した状態

    event :pre_register, :after => :send_pre_register_mail do
      transitions :to =>:pre_registered, :from => [:created]
    end
    event :activate, :after => :send_activate_mail do
      transitions :to =>:activated, :from => [:pre_registered]
    end
    event :leave, :after => :send_leave_mail do
      transitions :to =>:leaved, :from => [:registered]
    end
  end

  has_many :channels, :inverse_of => :owner, :dependent => :destroy

  @@reserved_words = %w(active_admin admin official info support login logout join agreement commerce individual leave disconnect owners auth users settings uploaded_images payments profiles apply activation tags tutorial).join("|")
  validates :email, :username, :presence => true
  validates :email, :username, :uniqueness => true
  validates_format_of :username, :with => /^[a-zA-Z0-9_]+$/, :message => I18n.t("models.user.you_can_use")
  validates_format_of :username, without: Regexp.new("^(#{@@reserved_words})$"), :message => I18n.t("models.user.reserved_words")
  validates_length_of :username, :minimum => 3, :message => I18n.t("models.user.more_than_3characters")

  acts_as_authentic do |config|
    config.login_field = 'email'
    config.merge_validates_uniqueness_of_login_field_options :scope => '_id', :case_sensitive => true
  end

  # callbacks
  set_callback(:create, :after) do
    self.pre_register_token = generate_pre_register_token
    self.save
    self.pre_register
    self.save
  end

  # actions
  def reissue_activation_code!
    # Userドキュメントの updated_at フィールドを現在時刻で
    # 書き換えることで、そのアカウントを有効化できる期間を延ばす。
    self.update_attribute(:updated_at, Time.now)
    Notifier.send_activation_instructions(self.id, @callback_url).deliver
  end

  def owner_of?(channel)
    self.channel_ids.include?(channel.id)
  end

  class << self
    def find_by_symbol(symbol)
      any_of({ email: symbol }, { username: symbol }).first
    end
  end

  private
  # 登録後にアカウントを有効化するための指示が書かれたメールをユーザに送る。
  def send_pre_register_mail
    Notifier.send_pre_register_mail(self.id, @callback_url).deliver
  end

  # 本登録完了を通知するメールを送る。
  def send_activate_mail
    Notifier.send_activate_mail(self.id, @callback_url).deliver
  end

  # 本登録用トークンを作成する。
  def generate_pre_register_token
    Base64::encode64(Digest::SHA1.hexdigest("#{self.id}#{Time.now}"))
  end

end
