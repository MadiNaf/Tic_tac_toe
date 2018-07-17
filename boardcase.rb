require 'player.rb'

class BoardCase
				attr_accessor :position, :empty, :symbol
				
				# Initialisation des instances de BoardCase avec par défaut empty =true et symbole à rien
				def initialize(position = "", empty = true, symbol = " ")
								@position = position
								@empty = empty
								@symbol = symbol
				end

				
				def is_played(p)
								@empty = false
								@symbol = p.symbol
				end
end

