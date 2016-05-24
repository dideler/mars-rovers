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

  def change_coordinates_by(x_delta, y_delta, dry_run: false)
    new_x = coordinates.x + x_delta
    new_y = coordinates.y + y_delta

    if dry_run
      [new_x, new_y]
    else
      [coordinates.x = new_x, coordinates.y = new_y]
    end
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
