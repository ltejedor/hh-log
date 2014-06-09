class BadgesController < ApplicationController
	def index
		@badges = Badge.all
	end

	def new
		@badge = Badge.new
	end

	def create
		@badge = Badge.new(badge_params)
		if @badge.save
			flash[:notice] = "Badge has been added."
			redirect_to @badge
		else
			flash[:alert] = "Badge has not been added."
			redirect_to badges_path
		end
	end

	def show
		@badge = Badge.find(params[:id])
	end

	private

	def badge_params
		params.require(:badge).permit(:name, :description)
	end


end
