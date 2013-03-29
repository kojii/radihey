require 'spec_helper'

describe "button_sets/edit" do
  before(:each) do
    @button_set = assign(:button_set, stub_model(ButtonSet))
  end

  it "renders the edit button_set form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => button_sets_path(@button_set), :method => "post" do
    end
  end
end
