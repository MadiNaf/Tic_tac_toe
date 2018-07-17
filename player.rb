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

		end
				
		def play(game)
								
				# Ask for the wanted position
				puts "#{@name}, what position do you wanna play?"
				# Get a response
				response = gets.chomp

				game.board.select_case(response).symbol = @symbol
				game.board.select_case(response).empty = false 
		end

end

