class SearchController < ApplicationController
	def search
		@books = Book.search(params[:search])
		@users = User.search(params[:search])
	end
end
