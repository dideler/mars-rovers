class Orientation
  class NavigationError < RuntimeError; end

  FULL_ROTATION_IN_DEGREES = 360
  DIRECTION_DEGREES = {
    'N' =>   0,
    'E' =>  90,
    'S' => 180,
    'W' => 270,
  }.freeze

  def initialize(direction)
    @current_direction = direction
  end

  def change_by_angle(degrees)
    new_heading = calculate_heading(degrees)
    @current_direction = direction(new_heading)
  end

  def to_s
    @current_direction
  end

  private

  def calculate_heading(angle_degrees)
    (heading + angle_degrees).modulo(FULL_ROTATION_IN_DEGREES)
  end

  def direction(heading)
    DIRECTION_DEGREES.invert.fetch(heading) { raise NavigationError, 'Unknown heading' }
  end

  def heading
    DIRECTION_DEGREES.fetch(@current_direction) { raise NavigationError, 'Unknown direction' }
  end
end
