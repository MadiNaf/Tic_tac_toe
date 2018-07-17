$LOAD_PATH.unshift('.')

require 'game.rb'
require 'board.rb'

		def	launch 
				partie1 = Game.new
				while partie1.game_over == "" do
						partie1.board.display
						partie1.player_to_play.play(partie1)
						partie1.evaluate
				end

				partie1.board.display
				puts partie1.evaluate
		end

launch

