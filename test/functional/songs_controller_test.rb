require 'test_helper'

class SongsControllerTest < ActionController::TestCase
  setup :activate_authlogic
  
  context "new song form" do
    setup do
      UserSession.create(Factory(:user))
      get(:new)
    end 
    
    should "be a multipart form" do
      assert_select('form[enctype=multipart/form-data]')
    end
  end
end