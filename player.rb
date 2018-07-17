require 'pry'

class Player

				attr_accessor :name, :symbol, :next_player, :count

				@@count = 0

				def initialize(next_player = true)

								puts "Enter a name"
								@name = gets.chomp 

								puts "Ok #{@name}, what symbol do you choose? ( 'o' or 'x' )"
								@symbol = gets.chomp
								
								@next_player = next_player

								counter # counts one object creation

				end
				
				def play

								
								# Ask for the wanted position
								puts "#{@name}, what position do you wanna play?"
								# Get a response
								response = gets.chomp

								a = @board.grid.select{|c| c.select{|c| c.position == response }}

								a[response[0]][response[1]].empty =false 
								@board.grid = a
								
							end

				# Calculates the number of created instances
				private def counter
							@@count += 1
				end
end

