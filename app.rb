require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/computer'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    if (params[:player_2_name]) == ''
      $game = Game.new(Player.new(params[:player_1_name]), Computer.new('Computer'))
    else
      $game = Game.new(Player.new(params[:player_1_name]), Player.new(params[:player_2_name]))
    end
    redirect '/play'
  end

  get '/play' do
    game
    @last_action = session[:last_action]
    erb :play
  end

  get '/attack' do
    game
    erb :attack
  end

  post '/attack' do
    session[:last_action] = :attack
    game.active_player == game.player1 ? game.attack2 : game.attack1
    redirect '/game_over' if game.game_over
    redirect '/attack'
  end

  post '/switch_turn' do
    game.switch_turn
    if game.active_player.computer
      game.attack1
      redirect '/game_over' if game.game_over
      redirect '/attack'
    else
      redirect '/play'
    end
  end

  get '/game_over' do
    @victor = game.active_player
    session[:last_action] = nil
    erb :game_over
  end

  helpers do
    def game
      @game ||= $game
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
