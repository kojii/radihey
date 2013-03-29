require 'spec_helper'

describe "button_images/index" do
  before(:each) do
    assign(:button_images, [
      stub_model(ButtonImage),
      stub_model(ButtonImage)
    ])
  end

  it "renders a list of button_images" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
