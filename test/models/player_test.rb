require 'test_helper'

class PlayerTest < ActiveSupport::TestCase

  test "Player should be invalid when they have no email" do
    invalid_email = "invalid"
    player = Player.new(name: "Player 1", email: invalid_email)

    assert ! player.valid?, "Email's format should have been checked"
  end

  test "Player should be invalid when they have an email out of the correct format" do

    player = Player.new

    assert ! player.valid?, "Email's existence should have been checked"
  end

  test "Player should be invalid when they have no name" do
    player = Player.new

    assert ! player.valid?, "Name's existence should have been checked"
  end

  test "When there is no nick name, presentation_name should return the actual name of the player" do
    expected = "Player1"
    player = Player.new(name: expected, nickname: nil)

    assert_equal expected, player.presentation_name, "#{expected} was expected but the result was #{player.presentation_name}"
  end

  test "When there is a nick name, presentation_name should return it" do
    expected = "nick_name"
    player = Player.new(name: "Player", nickname: expected)

    assert_equal expected, player.presentation_name, "#{expected} was expected but the result was #{player.presentation_name}"
  end

  test "Player should be valid when they have a Name and an Email that matches the correct format" do
    correct_name = "Aname"
    correct_email = "email@company.com"
    player = Player.new(name: correct_name, email: correct_email)

    assert player.valid?, "Player is still invalid when they have a correct name and email"
  end

end
