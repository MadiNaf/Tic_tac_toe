require 'pry'
require 'board.rb'
require 'boardcase.rb'
require 'game.rb'

class Player

		attr_accessor :name, :symbol

		@@count = 0

		def initialize(next_player = true)

				puts "Enter a name"
				@name = gets.chomp 

				puts "Ok #{@name}, what symbol do you choose? ( 'o' or 'x' )"
				@symbol = gets.chomp

				while @symbol =~ /[^xo]{1,}/ 
						puts "enter a validi symbol"
						puts "symbol should be exactlly 'x' or 'o' "
						@symbol = gets.chomp
				end
		end
				
		def play(game)
								
				# Ask for the wanted position
				puts "#{@name}, what position do you wanna play?"
				# Get a response
				response = gets.chomp
				while game.board.select_case(response).empty == false do
						puts "Position already played, enter another one!"
						response =gets.chomp
				end
				game.board.select_case(response).symbol = @symbol
				game.board.select_case(response).empty = false 
		end

end

