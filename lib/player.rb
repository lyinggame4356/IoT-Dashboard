class Player

  attr_reader :name, :hp, :computer

  def initialize(name)
    @name = name
    @hp = 100
    @computer = false
  end

  def attacked
    @hp -= Kernel.rand(20)
  end

end
