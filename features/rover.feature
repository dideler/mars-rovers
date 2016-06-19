Feature: Rover navigation
  As a Rover controller
  I want to navigate the Rover
  Because I want to explore a Plateau

Scenario Outline: Rover can turn left
  Given a Rover is facing "<direction>"
  When given instructions to turn left
  Then it will be facing "<new_direction>"

  Examples:
  | direction | new_direction |
  | N         | W             |
  | W         | S             |
  | S         | E             |
  | E         | N             |

Scenario Outline: Rover can turn right
  Given a Rover is facing "<direction>"
  When given instructions to turn right
  Then it will be facing "<new_direction>"

  Examples:
  | direction | new_direction |
  | N         | E             |
  | W         | N             |
  | S         | W             |
  | E         | S             |

Scenario: Rover can move vertically
  Given a Rover at position "0 0 N"
  When given instructions to move forward
  Then it will be at position "0 1 N"

Scenario: Rover can move horizontally
  Given a Rover at position "0 0 E"
  When given instructions to move forward
  Then it will be at position "1 0 E"

Scenario: Rover stays put
  Given a Rover at position "0 0 N"
  When given empty instructions
  Then it will be at position "0 0 N"

Scenario: Rover does not drive off the Plateau
  Given a Plateau with upper-right coordinates "1 1"
  And a Rover at position "0 1 N"
  When given instructions to move forward
  Then it will be at position "0 1 N"
