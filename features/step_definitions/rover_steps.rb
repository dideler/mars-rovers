require 'rover'

Given 'a Plateau with upper-right coordinates "$coords"' do |coords|
  x, y = coords.split.map(&:to_i)
  @plateau = Plateau.new(x, y)
end

Given 'a Rover is facing "$direction"' do |direction|
  position = Position.create(x: 0, y: 0, max_x: 1, max_y: 1, direction: direction)
  @rover = Rover.new(position)
end

Given 'a Rover at position "$position"' do |position|
  x, y, direction = position.split
  x, y = x.to_i, y.to_i

  @plateau ||= Plateau.new(x + 1, y + 1)
  coordinates = Coordinates.new(x, y)
  orientation = Orientation.new(direction)
  position = Position.new(coordinates, orientation, @plateau)
  @rover = Rover.new(position)
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

When 'given empty instructions' do
  @rover.run('')
end

Then 'it will be facing "$direction"' do |direction|
  expect(@rover.direction.to_s).to eq(direction)
end

Then 'it will be at position "$position"' do |position|
  expect(@rover.position.to_s).to eq(position)
end
