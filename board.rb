require 'pry'
require 'boardcase.rb'

class Board

		def initialize

				a = Hash.new

				for i in 1..3

						for j in 1..3
								a[ i.to_s + j.to_s] = BoardCase.new(i.to_s + j.to_s)
						end
				end
						
				@grid = a 
		end

		# A method that selects a case by its position and give back a Boardcase type object
		
		def select_case(position)
				return @grid[position]
		end

		# A that displays graphically the board
		
		def display
				print (" "*2 + " - ")*3  + "\n"	

				position = ""
						
				for i in 1..3
						print " | "
						for j in 1..3
								print select_case(i.to_s + j.to_s).symbol.to_s + " | "
						end
						print "\n"
						print (" "*2 + " - ")*3  + "\n"	
				end
		end

		# A method that gives the number of cases played
		
		def used_cases_counter

				k = 0	

				for i in 1..3
						for j in 1..3
								k +=1 unless select_case(i.to_s + j.to_s).empty == true 
						end
				end

				return k
		end
end

