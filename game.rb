$LOAD_PATH.unshift('.')

require 'pry'
require "board.rb"
require "boardcase.rb"
require "player.rb"

class Game

		attr_accessor :game_over, :board

		def initialize
				@board = Board.new
				@player1 = Player.new
				@player2 = Player.new(false)
				@player_to_play = @player1
				@game_over = ""
		end

		def player_to_play
				if @player_to_play == @player1
						@player_to_play = @player2
				else
						@player_to_play = @player1
				end
		end
				
		def evaluate
							
				#lines evaluation
				for i in 1..3
						line[i-1] =	@board.select_case(i.to_s +"1").symbol.to_s +
								@board.select_case(i.to_s +"2").symbol.to_s +
								@board.select_case(i.to_s +"3").symbol.to_s
				end
				
				#columns evaluation
				for i in 1..3
						column[i-1] =	@board.select_case("1"+j.to_s).symbol.to_s +
										@board.select_case("2"+j.to_s).symbol.to_s +
										@board.select_case("3"+j.to_s).symbol.to_s
				end

				#diagonals


		end


end
				
		
