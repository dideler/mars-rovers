require 'rover'

Given 'a Rover facing "$direction"' do |direction|
  plateau = Plateau.new(max_x: 1, max_y: 1)
  coordinates = Coordinates.new(0, 0)
  orientation = Orientation.new(direction)
  position = Position.new(coordinates, orientation)
  @rover = Rover.new(plateau, position)
end

When 'given instructions to turn left' do
  @rover.run('L')
end

When 'given instructions to turn right' do
  @rover.run('R')
end

Then 'it will be facing "$direction"' do |direction|
  expect(@rover.direction).to eq(direction)
end
