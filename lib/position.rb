require 'coordinates'
require 'orientation'
require 'plateau'

class Position
  attr_reader :coordinates, :orientation
  alias_method :location, :coordinates
  alias_method :direction, :orientation

  def self.create(**options)
    coordinates = Coordinates.new(options.fetch(:x), options.fetch(:y))
    orientation = Orientation.new(options.fetch(:direction))
    plateau = Plateau.new(options.fetch(:max_x), options.fetch(:max_y))
    new(coordinates, orientation, plateau)
  end

  def initialize(coordinates, orientation, plateau)
    @coordinates = coordinates
    @orientation = orientation
    @plateau = plateau
  end

  def try_moving_straight(units)
    case
    when orientation.east?
      safely_change_coordinates_by(x_delta: units)
    when orientation.west?
      safely_change_coordinates_by(x_delta: -units)
    when orientation.north?
      safely_change_coordinates_by(y_delta: units)
    when orientation.south?
      safely_change_coordinates_by(y_delta: -units)
    end
  end

  def change_orientation_by_angle(degrees)
    orientation.change_by_angle(degrees)
  end

  def to_s
    "#{coordinates} #{orientation}"
  end

  private

  attr_reader :plateau

  def safe_to_move?(x_delta: 0, y_delta: 0)
    plateau.within_bounds?(coordinates.x + x_delta, coordinates.y + y_delta)
  end

  def safely_change_coordinates_by(x_delta: 0, y_delta: 0)
    if safe_to_move?(x_delta: x_delta, y_delta: y_delta)
      [coordinates.x += x_delta, coordinates.y += y_delta]
    end
  end
end
