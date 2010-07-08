require 'spec_helper'

describe "users/show.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :email => "Email",
      :password => "Password",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Email".to_s)
    rendered.should contain("Password".to_s)
    rendered.should contain("Name".to_s)
  end
end
