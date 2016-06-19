class MoveCommand
  def self.execute(rover)
    rover.move_straight_safely(1)
  end
end
