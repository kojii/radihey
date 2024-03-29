module BootstrapFlashHelper
  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      # Skip Devise :timeout and :timedout flags
      next if type == :timeout
      next if type == :timedout
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?
      type = :success if type == :notice
      type = :error if type == :alert
      text = content_tag(:div,
               content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert") +
               message, :class => "alert fade in alert-#{type}")
      flash_messages << text if message
    end
    flash_messages.join("\n").html_safe
  end
end
