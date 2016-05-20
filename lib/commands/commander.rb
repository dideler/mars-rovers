require 'commands/left_command'
require 'commands/right_command'

class Commander
  COMMANDS = {
    'L' => LeftCommand,
    'R' => RightCommand,
  }
  private_constant :COMMANDS

  def self.execute(instructions, rover)
    instructions.split('').each do |i|
      COMMANDS[i].execute(rover)
    end
  end
end
