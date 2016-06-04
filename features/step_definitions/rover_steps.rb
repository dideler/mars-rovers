require 'rover'

Given 'a Plateau with upper-right coordinates "$coords"' do |coords|
  x, y = coords.split.map(&:to_i)
  @plateau = Plateau.new(max_x: x, max_y: y)
end

Given 'a Rover is facing "$direction"' do |direction|
  plateau = Plateau.new(max_x: 1, max_y: 1)
  coordinates = Coordinates.new(0, 0)
  orientation = Orientation.new(direction)
  position = Position.new(coordinates, orientation)
  @rover = Rover.new(plateau, position)
end

Given 'a Rover at position "$position"' do |position|
  x, y, direction = position.split
  x, y = x.to_i, y.to_i
  @plateau ||= Plateau.new(max_x: x + 1, max_y: y + 1)
  coordinates = Coordinates.new(x, y)
  orientation = Orientation.new(direction)
  position = Position.new(coordinates, orientation)
  @rover = Rover.new(@plateau, position)
end

When 'given instructions to turn left' do
  @rover.run('L')
end

When 'given instructions to turn right' do
  @rover.run('R')
end

When 'given instructions to move forward' do
  @rover.run('M')
end

When 'given no instructions' do
  @rover.run('')
end

Then 'it will be facing "$direction"' do |direction|
  expect(@rover.direction.to_s).to eq(direction)
end

Then 'it will be at position "$position"' do |position|
  expect(@rover.position.to_s).to eq(position)
end
