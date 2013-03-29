require 'spec_helper'

describe "button_images/show" do
  before(:each) do
    @button_image = assign(:button_image, stub_model(ButtonImage))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
