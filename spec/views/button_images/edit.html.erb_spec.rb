require 'spec_helper'

describe "button_images/edit" do
  before(:each) do
    @button_image = assign(:button_image, stub_model(ButtonImage))
  end

  it "renders the edit button_image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => button_images_path(@button_image), :method => "post" do
    end
  end
end
