require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

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

end
