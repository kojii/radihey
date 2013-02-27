class CustomButton < Button
  belongs_to :owner, class_name: User.to_s, :inverse_of => :buttons
end
