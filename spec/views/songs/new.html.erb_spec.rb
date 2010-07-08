require 'spec_helper'

describe "songs/new.html.erb" do
  before(:each) do
    assign(:song, stub_model(Song,
      :new_record? => true,
      :name => "MyString"
    ))
  end

  it "renders new song form" do
    render

    rendered.should have_selector("form", :action => songs_path, :method => "post") do |form|
      form.should have_selector("input#song_name", :name => "song[name]")
    end
  end
end
