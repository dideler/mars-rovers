require 'coordinates'
require 'orientation'

class Position
  attr_reader :coordinates, :orientation
  alias_method :location, :coordinates
  alias_method :direction, :orientation

  def initialize(coordinates, orientation)
    @coordinates = coordinates
    @orientation = orientation
  end

  def change_orientation_by_angle(degrees)
    orientation.change_by_angle(degrees)
  end

  def change_coordinates_by(x_delta, y_delta)
    [coordinates.x += x_delta, coordinates.y += y_delta]
  end

  def to_s
    "#{coordinates} #{orientation}"
  end
end
