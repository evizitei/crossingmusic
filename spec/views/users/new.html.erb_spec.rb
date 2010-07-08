require 'spec_helper'

describe "users/new.html.erb" do
  before(:each) do
    assign(:user, stub_model(User,
      :new_record? => true,
      :email => "MyString",
      :password => "MyString",
      :name => "MyString"
    ))
  end

  it "renders new user form" do
    render

    rendered.should have_selector("form", :action => users_path, :method => "post") do |form|
      form.should have_selector("input#user_email", :name => "user[email]")
      form.should have_selector("input#user_password", :name => "user[password]")
      form.should have_selector("input#user_name", :name => "user[name]")
    end
  end
end
