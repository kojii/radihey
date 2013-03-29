require 'spec_helper'

describe "button_images/new" do
  before(:each) do
    assign(:button_image, stub_model(ButtonImage).as_new_record)
  end

  it "renders new button_image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => button_images_path, :method => "post" do
    end
  end
end
