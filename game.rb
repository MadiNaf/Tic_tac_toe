$LOAD_PATH.unshift('.')

require 'pry'
require "board.rb"
require "boardcase.rb"
require "player.rb"

class Game

		attr_accessor :game_over, :board

		def initialize
				@board = Board.new
				puts "Player 1"
				@player1 = Player.new
				puts "Player 2"
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
							
				results = Array.new
				line = Array.new
				column = Array.new
				diagonal = Array.new


				if @board.used_cases_counter == 9
						@game_over = "Fair game!"
						return @game_over
				end

				#lines results 
				for i in 1..3
						line <<	@board.select_case(i.to_s + 1.to_s).symbol.to_s + @board.select_case(i.to_s + 2.to_s).symbol.to_s +	@board.select_case(i.to_s + 3.to_s).symbol.to_s
				end
				
				#columns results 
				for i in 1..3
						column << @board.select_case(1.to_s+i.to_s).symbol.to_s + @board.select_case(2.to_s+i.to_s).symbol.to_s + @board.select_case(3.to_s+i.to_s).symbol.to_s
				end

				#diagonals results
						diagonal << @board.select_case("11").symbol.to_s + @board.select_case("22").symbol.to_s +	@board.select_case("33").symbol.to_s
						diagonal << @board.select_case("13").symbol.to_s + @board.select_case("22").symbol.to_s +	@board.select_case("31").symbol.to_s

				#Evaluation
				
				results =[line, column, diagonal]
				results.flatten.each{|r| 
						if r == @player1.symbol.to_s*3
								@game_over = "Well done #{@player1.name}"
								return @game_over
						end

						if r == @player2.symbol.to_s*3
								@game_over = "Well done #{@player2.name}"
								return @game_over
						end
				}


		end


end
				
		
