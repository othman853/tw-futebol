require 'test_helper'

class PlayersTest < ActionDispatch::IntegrationTest

  test 'new player submit should redirect to players index with success messa when the form is correctly filled' do

    visit new_player_path

    within("#new-player-form") do
      fill_in "Name", with: "A"
      fill_in "Email", with: "email@tw.com"
      click_on "Save Player"
    end

    assert_equal players_path, current_path

    within "#success-message" do
      assert has_content? "Player created successfully."
    end

  end

end
