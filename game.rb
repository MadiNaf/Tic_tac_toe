$LOAD_PATH.unshift('.')

require 'pry'
require "board.rb"
require "boardcase.rb"
require "player.rb"

class Game




				def initialize
								@board = Board.new
								@player1 = Player.new
								@player2 = Player.new(false)
				end




				def play_one_move

								#Define the next player
								if @player1.next_player 
												p = @player1
								else
												p = @player2
								end

								# Ask for the wanted position
								puts "#{p.name}, what position do you wanna play?"
								response = gets.chomp

								a = @board.grid.select{|c| c.select{|c| c.position == response }}

								a[response[0]][response[1]].empty =false 
								@board.grid = a
								
								# Update the next player
								if @player1.next_player 
												@player1.next_player = false
												@player2.next_player = true
								else
												@player2.next_player = false
												@player1.next_player = true
								end

				end




				def evaluate
							
								# winning cases

								result = ""
								
								# evaluation of the lines
								for i in 1..3
												
												for j in 1..3
																result = result  + @board.grid[i-1][j-1].symbol
												end
												
												case 

												when result == @player1.symbol*3 
																return "#{@player1} a gagné !"

												when result == @player1.symbol*3 
																return  "#{@player1} a gagné !"

												end

								end	
								
								# evaluation of the columns
								for j in 1..3
												
												for i in 1..3
																result = result  + @board.grid[i-1][j-1].symbol
												end
												
												case 

												when result == @player1.symbol*3 
																return  "#{@player1} a gagné !"

												when result == @player2.symbol*3 
																return  "#{@player2} a gagné !"
												end

								end	
								
								#evaluation of diagonals and fair game
								case
								when @board.grid[0][0].symbol + @board.grid[1][1].symbol + @board.grid[2][2].symbol == @player1.symbol*3
												return  "#{@player1} a gagné !"
								
								when @board.grid[0][0].symbol + @board.grid[1][1].symbol + @board.grid[2][2].symbol == @player2.symbol*3
												return  "#{@player2} a gagné !"
								
								when @board.grid[0][2].symbol + @board.grid[1][1].symbol + @board.grid[2][0].symbol == @player1.symbol*3
												return  "#{@player1} a gagné !"

								when @board.grid[0][2].symbol + @board.grid[1][1].symbol + @board.grid[2][0].symbol == @player2.symbol*3
												return  "#{@player2} a gagné !"

								when @board.used_cases_counter == 9
												return "fair game!"
								else
												return	"" 
								end
				end	


				def display
								
								print "-    -    -\n"	

								a = Array.new
								a = @board.grid
								
								for i in 1..3

												for j in 1..3

															 print a[i-1][j-1].symbol + " | " 
												end

												print "-    -    -\n"	
								end
				end

				
end
				
				def global_play

								partie1 = Game.new

								while partie1.evaluate == "" do
												partie1.display
												partie1.play_one_move
								end
				end

				global_play
