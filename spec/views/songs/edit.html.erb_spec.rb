require 'spec_helper'

describe "songs/edit.html.erb" do
  before(:each) do
    @song = assign(:song, stub_model(Song,
      :new_record? => false,
      :name => "MyString"
    ))
  end

  it "renders the edit song form" do
    render

    rendered.should have_selector("form", :action => song_path(@song), :method => "post") do |form|
      form.should have_selector("input#song_name", :name => "song[name]")
    end
  end
end
