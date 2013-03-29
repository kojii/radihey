require 'spec_helper'

describe "button_sets/index" do
  before(:each) do
    assign(:button_sets, [
      stub_model(ButtonSet),
      stub_model(ButtonSet)
    ])
  end

  it "renders a list of button_sets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
