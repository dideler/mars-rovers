class Coordinates < Struct.new(:x, :y)
  def to_s
    "#{x} #{y}"
  end
end
