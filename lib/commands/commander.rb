require 'commands/left_command'

class Commander
  COMMANDS = {
    'L' => LeftCommand,
  }
  private_constant :COMMANDS

  def self.execute(instructions, rover)
    instructions.split('').each do |i|
      COMMANDS[i].execute(rover)
    end
  end
end
