require 'coordinates'
require 'orientation'

class Position
  def initialize(coordinates, orientation)
    @coordinates = coordinates
    @orientation = orientation
  end

  def change_orientation_by_angle(degrees)
    orientation.change_by_angle(degrees)
  end

  def change_coordinates_by(x_delta, y_delta)
    coordinates.x += x_delta
    coordinates.y += y_delta
  end

  def direction
    orientation.to_s
  end

  def to_s
    "#{coordinates} #{orientation}"
  end

  private

  attr_reader :coordinates, :orientation
end
