require 'spec_helper'

describe "button_sets/new" do
  before(:each) do
    assign(:button_set, stub_model(ButtonSet).as_new_record)
  end

  it "renders new button_set form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => button_sets_path, :method => "post" do
    end
  end
end
