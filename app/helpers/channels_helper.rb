module ChannelsHelper
  def my_page?
     logged_in? and current_user == login_user
  end
end
