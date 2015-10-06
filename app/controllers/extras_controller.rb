class ExtrasController < ApplicationController

	def show
		@extra = Extra.find(params[:id])
	end
end
