require 'spec_helper'

describe "songs/index.html.erb" do
  before(:each) do
    assign(:songs, [
      stub_model(Song,
        :name => "Name"
      ),
      stub_model(Song,
        :name => "Name"
      )
    ])
  end

  it "renders a list of songs" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
  end
end
