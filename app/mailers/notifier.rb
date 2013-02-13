class Notifier < ActionMailer::Base
  helper :application
  layout 'layouts/notifier'

  default_url_options[:host] = RadiheyRails::HOST
  default :from => I18n.t("mailers.notifier.default_from")

  def send_pre_register_mail(user_id, callback_url=nil)
    @user = User.find(user_id)
    @callback_url = callback_url
    mail(to: @user.email, subject: t("mailers.notifier.send_pre_register_mail.subject"))
  end

  def send_activate_mail(user_id, callback_url=nil)
    @user = User.find(user_id)
    @callback_url = callback_url
    mail(to: @user.email, subject: t("mailers.notifier.send_activate_mail.subject"))
  end

  def send_test_mail(user_id, callback_url=nil)
    @user = User.find(user_id)
    @callback_url = callback_url
    mail(to: @user.email, subject: t("mailers.notifier.send_test_mail.subject"))
  end

end
