require 'matrix'

class Grid 

  attr_reader :ships

  def initialize
    @ships = []
    @shots = []
  end 


  def display
    puts "    1   2   3   4   5   6   7   8   9   10"
    puts separator
    ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"].each do |letter|
      puts grid_line(letter)
    end
    puts separator
  end


  def grid_line letter
    y = y_of(letter)
    slots = []
    (1..10).each do |x|
      if ship = has_ship_on?(x, y)
        hole = ship.covers? x, y
        slots << hole.to_s
      elsif hole = @shots.find {|s| s.x == x && s.y == y}
        slots << hole.to_s
      else
        slots << " "
      end
    end
    "#{letter} | #{slots.join(" | ")} |"
  end


  def place_ship ship, x, y, horizontal
    ship.place(x, y, horizontal)
    return false if @ships.find { |length| length.overlaps_with? ship}
    @ships << ship
  end


  def has_ship_on? x, y
    @ships.find { |ship| ship.covers? x, y}
  end


  def overlaps_with? other_ship
    @ship.find.overlaps_with_othership { |hole| other_ship.covers? hole[0], hole[1] } 
  end


  def fire_at x, y 
    return false if x > 10 || y > 10
  #if has_ship_on? pass the fire onto the ship
   # if there is no ship there, return miss 
 end 


def sunk?
  return false if @ships.empty?
    @ships.select{|ship| ship.sunk?}.count == @ships.count
end

def x_of(str)
  str[1..-1].to_i
    #Grid.x_of(str)
  end

  def y_of(str)
    str[0].ord - 64
    #Grid.y_of(str)
  end 


  def separator
    "  -----------------------------------------"
  end
end





# def line
#     row = []
#     (0..9).each do |col|
#       if has_ship_on?(col, letter)
#         row << 'O'
#       else
#         row << ' '
#       end
#     end
#     str << row.join(' | ')
#     str << "\n"
#   end
#   str
# end 