require_relative 'player'

class Computer < Player

  def initialize(name)
    super
    @name = name
    @computer = true
  end

end
