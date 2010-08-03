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
  
  context "ordering songs" do
    setup do 
      Song.delete_all
      @songs = [Factory(:song,:id=>1,:placement=>4),
                Factory(:song,:id=>2,:placement=>2),
                Factory(:song,:id=>3,:placement=>3),
                Factory(:song,:id=>4,:placement=>1)]
    end
    
    should "accept posted order" do
      post(:update_order,{:order=>["2","4","3","1"]})
      assert_equal 0,Song.find(2).placement
      assert_equal 1,Song.find(4).placement
      assert_equal 2,Song.find(3).placement
      assert_equal 3,Song.find(1).placement
    end
  end
end