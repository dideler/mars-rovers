class Plateau
  class InvalidBoundary < ArgumentError; end

  def initialize(max_x, max_y, min_x = 0, min_y = 0)
    @max_x, @max_y = max_x, max_y
    @min_x, @min_y = min_x, min_y
    validate_coordinates!
  end

  def within_bounds?(x, y)
    min_x <= x && min_y <= y &&
    max_x >= x && max_y >= y
  end

  private

  attr_reader :min_x, :min_y, :max_x, :max_y

  def validate_coordinates!
    raise InvalidBoundary, 'Max coordinates must be positive' unless max_x.positive? && max_y.positive?
  end
end

# class Plateau
#   class InvalidBoundary < ArgumentError; end
#
#   def initialize(min_x: 0, min_y: 0, max_x:, max_y:)
#     @min_coords = Coordinates.new(min_x, min_y)
#     @max_coords = Coordinates.new(max_x, max_y)
#     validate_coordinates!
#   end
#
#   def within_bounds?(x, y)
#     min_coords.x <= x && min_coords.y <= y &&
#     max_coords.x >= x && max_coords.y >= y
#   end
#
#   private
#
#   attr_reader :min_coords, :max_coords
#
#   def validate_coordinates!
#     raise InvalidBoundary, 'Max coordinates must be positive' unless max_coords.positive?
#   end
# end

# class Coordinates
#   attr_accessor :x, :y
#
#   def initialize(x, y)
#     @x = x
#     @y = y
#   end
#
#   def positive?
#     state.all?(&:positive?)
#   end
#
#   def ==(other)
#     self.class == other.class && self.state == other.state
#   end
#
#   protected
#
#   def state
#     [x, y]
#   end
# end
