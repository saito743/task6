class FavoritesController < ApplicationController
	def create
		binding.pry
		@book = Book.find(params[:book_id])
		favorite = current_user.favorites.new(book_id: @book.id)
		if 	favorite.save
			redirect_to request.referer
		else
			render_to root_path
		end
	end

	def destroy
		@book = Book.find(params[:book_id])
		favorite = current_user.favorites.find_by(book_id: @book.id)
		favorite.destroy
		redirect_to request.referer
	end
end
