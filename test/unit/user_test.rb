require 'test_helper'

class UserTest < Test::Unit::TestCase
  context "user" do
    context "with complete data" do
      setup do
        @user = Factory.build(:user)
      end
      
      should "be valid" do
        assert @user.valid?
      end
      
      should "be invalid if name is removed" do
        @user.name = nil
        assert !@user.valid?
      end
      
      should "be invalid if password is changed" do
        @user.password = "some other non-matching password"
        assert !@user.valid?
      end
      
      should "be invalid if confirmation is removed" do
        @user.password_confirmation = nil
        assert !@user.valid?
      end
      
      should "be invalid if email is removed" do
        @user.email = nil
        assert !@user.valid?
      end
    end
  end
end