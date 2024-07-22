require 'forwardable'

class Game
  extend Forwardable

  attr_reader :player1, :player2, :active_player, :inactive_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @active_player = player1
    @inactive_player = player2
  end

  def_delegator :@player1, :attacked, :attack1
  def_delegator :@player2, :attacked, :attack2

  def_delegator :@player1, :name, :name1
  def_delegator :@player2, :name, :name2

  def_delegator :@player1, :hp, :hp1
  def_delegator :@player2, :hp, :hp2

  def switch_turn
    @active_player == player1 ? @active_player = player2 : @active_player = player1
    @inactive_player == player1 ? @inactive_player = player2 : @inactive_player = player1
  end

  def game_over
    hp1 <= 0 || hp2 <= 0
  end

end
