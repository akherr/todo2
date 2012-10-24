require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "full name without a middle name" do
    user = User.create(:first_name => "Austin", :last_name => "Herr")
    assert_equal "Austin Herr", user.full_name
  end

  test "full name with a middle name" do
    user = User.create(:first_name => "Austin", :middle_name => "King", :last_name => "Herr")
    assert_equal "Austin King Herr", user.full_name
  end
  test "full name with only a first name" do
    user = User.create(:first_name => "Austin")
    assert_equal "Austin", user.full_name
  end
  
  should validate_presence_of(:first_name)
  should validate_presence_of(:email)
end
