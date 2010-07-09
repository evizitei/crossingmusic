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
end
