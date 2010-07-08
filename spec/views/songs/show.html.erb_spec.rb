require 'spec_helper'

describe "songs/show.html.erb" do
  before(:each) do
    @song = assign(:song, stub_model(Song,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
  end
end
