require 'test_helper'

class PlayerTest < ActiveSupport::TestCase

  def setup
    @first_player = players(:first_player)
    @player_with_no_nickname = players(:player_with_no_nickname)
    @player_with_nickname = players(:player_with_nickname)
  end

  test "Player should be invalid when they have no email" do
    @first_player.email = "invalid"

    assert ! @first_player.valid?, "Email's format should have been checked"
  end

  test "Player should be invalid when they have an email out of the correct format" do
    @first_player.email = nil

    assert ! @first_player.valid?, "Email's existence should have been checked"
  end

  test "Player should be invalid when they have no name" do
    @first_player.name = nil

    assert ! @first_player.valid?, "Name's existence should have been checked"
  end

  test "When there is no nick name, presentation_name should return the actual name of the player" do
    assert_equal @player_with_no_nickname.name, @player_with_no_nickname.presentation_name, "#{@player_with_nickname.name} was expected but the result was #{@player_with_nickname.presentation_name}"
  end

  test "When there is a nick name, presentation_name should return it" do
    assert_equal @player_with_nickname.nickname, @player_with_nickname.presentation_name, "#{@player_with_nickname.nickname} was expected but the result was #{@player_with_nickname.presentation_name}"
  end

  test "Player should be valid when they have a Name and an Email that matches the correct format" do
    assert @first_player.valid?, "Player is still invalid when they have a correct name and email"
  end

end
