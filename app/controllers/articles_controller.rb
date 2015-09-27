class ArticlesController < ApplicationController
	def index
		@articles = Article.all.paginate(page: params[:page], :per_page => 5)
	end

	def show
		@article = Article.find(params[:id])
	end
end
