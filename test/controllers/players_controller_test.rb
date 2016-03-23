require 'test_helper'

class PlayersControllerTest < ActionController::TestCase

  test "should get new player page" do
    get :new
    assert_response :success
  end

  test "Should create a user and ignore not whitelisted param" do

    post :create, player: { name: 'a', email: 'a@a.com', ignored: "ignore" }

    assert_not_nil assigns(:player)
    assert_equal 'a', assigns(:player).name
    assert_equal 'a@a.com', assigns(:player).email
  end

end
