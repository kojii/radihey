module ChannelsHelper
  def owner?
     logged_in? and current_user == login_user
  end
end
