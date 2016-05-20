Feature: Rover navigation
  As a Rover controller
  I want to navigate the Rover
  Because I want to explore a Plateau

Scenario Outline: Rover can turn left
  Given a Rover facing "<direction>"
  When given instructions to turn left
  Then it will be facing "<new_direction>"

  Examples:
  | direction | new_direction |
  | N         | W             |
  | W         | S             |
  | S         | E             |
  | E         | N             |

Scenario Outline: Rover can turn right
  Given a Rover facing "<direction>"
  When given instructions to turn right
  Then it will be facing "<new_direction>"

  Examples:
  | direction | new_direction |
  | N         | E             |
  | W         | N             |
  | S         | W             |
  | E         | S             |

