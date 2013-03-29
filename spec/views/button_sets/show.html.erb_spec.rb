require 'spec_helper'

describe "button_sets/show" do
  before(:each) do
    @button_set = assign(:button_set, stub_model(ButtonSet))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
