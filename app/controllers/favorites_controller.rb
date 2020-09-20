class FavoritesController < ApplicationController
	def create
		redirect_to requuest.referer
	end

	def destroy
		redirect_to requuest.referer
	end
end
