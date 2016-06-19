class Plateau
  class InvalidBoundary < ArgumentError; end

  def initialize(min_x = 0, min_y = 0, max_x, max_y)
    @min_x = min_x
    @min_y = min_y
    @max_x = max_x
    @max_y = max_y
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

