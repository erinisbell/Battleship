require 'matrix'
require_relative 'hole'

class Ship

  attr_reader :length, :ship, :place

  def initialize length
    @length = length 
    @hits = [] 
  end 

  def place x, y, horizontal
   return false if placed?
   @x = x
   @y = y
   @horizontal = horizontal
   true
 end

 def covers? x, y
  positions.find {|h| h.x == x && h.y == y}
end

def placed?
  @x || @y
end
def overlaps_with? ship
  positions.find { |hole| ship.covers? hole.x, hole.y } 
end

def fire_at x, y
  hole = covers?(x, y)
  return false unless hole
  hole.hit!
end

def hit? x, y
  return true if covers?
end

def sunk?
 return false unless placed?
 positions.length == @length
end

private

def positions
  return @positions if @positions
  @positions = []
  delta = Vector[@horizontal ? 1 : 0, @horizontal ? 0 : 1]
  accumulator = Hole.new(Vector[@x, @y])
  @length.times do
    @positions << accumulator.clone
    accumulator = accumulator + delta
  end
  @positions
end

end 
