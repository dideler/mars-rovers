require 'commands/left_command'
require 'commands/right_command'
require 'commands/move_command'

class Commander
  class InvalidInstruction < RuntimeError; end

  COMMANDS = {
    'L' => LeftCommand,
    'R' => RightCommand,
    'M' => MoveCommand,
  }.freeze
  private_constant :COMMANDS

  def self.execute(instructions, rover)
    instructions.split('').each do |i|
      command_for(i).execute(rover)
    end
  end

  def self.command_for(instruction)
    COMMANDS.fetch(instruction) {
      raise InvalidInstruction, "Instruction '#{instruction}' not recognised"
    }
  end
  private_class_method :command_for
end
