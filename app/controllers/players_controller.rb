class PlayersController < ApplicationController

  def new
  end

  def index
    @players = Player.all
  end

  def create
    @player = Player.new(whitelisted_params)

    if @player.save
        flash[:success] = "Player created successfully."
        redirect_to players_path
    else
      flash[:error] = "Could not create the player. :("
      redirect_to new_player_path
    end
  end

  private

    def whitelisted_params
      params.require(:player).permit([:name, :email, :nickname])
    end

end
