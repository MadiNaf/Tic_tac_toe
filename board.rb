require 'boardcase.rb'

class Board
				
				attr_accessor :grid


				def initialize

								a = Array.new(3, Array.new(3, BoardCase.new))

								for i in 1..3
												for j in 1..3
																a[i-1][j-1].position = i.to_s + j.to_s
												end
								end
								
								@grid = a 
				end

				# A method that selects a case by its position and give back a Boardcase type object
				
				def select_case(position)
								a = @grid
								return a[position[0],position[1]]
				end

				# A that displays graphically the board
				
				def display
								
								print "-    -    -\n"	

								a = Array.new
								a = @board.grid
								
								for i in 1..3

												for j in 1..3

																print @board.select_case(i.to_s +j.to_s).symbol + " | " 
												end
												print "\n"
												print "-    -    -\n"	
								end
				end

				# A method that gives the number of cases played
				
				def used_cases_counter
								
								k = 0	

								a = @grid

								for i in 1..3
												for j in 1..3
																k +=1 unless a[i-1][j-1].empty == true 
												end
								end

								return k
				end
end

