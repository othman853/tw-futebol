require 'test_helper'

class PlayerTest < ActiveSupport::TestCase

  test "Player should be invalid when they have no email" do
    player = players(:first_player)
    player.email = "invalid"

    assert ! player.valid?, "Email's format should have been checked"
  end

  test "Player should be invalid when they have an email out of the correct format" do

    player = players(:first_player)
    player.email = nil

    assert ! player.valid?, "Email's existence should have been checked"
  end

  test "Player should be invalid when they have no name" do
    player = players(:first_player)
    player.name = nil

    assert ! player.valid?, "Name's existence should have been checked"
  end

  test "When there is no nick name, presentation_name should return the actual name of the player" do
    player = players(:player_with_no_nickname)

    assert_equal player.name, player.presentation_name, "#{player.name} was expected but the result was #{player.presentation_name}"
  end

  test "When there is a nick name, presentation_name should return it" do
    player = players(:player_with_nickname)

    assert_equal player.nickname, player.presentation_name, "#{player.nickname} was expected but the result was #{player.presentation_name}"
  end

  test "Player should be valid when they have a Name and an Email that matches the correct format" do
    player = players(:first_player)

    assert player.valid?, "Player is still invalid when they have a correct name and email"
  end

end
