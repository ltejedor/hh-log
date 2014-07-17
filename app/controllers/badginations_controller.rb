class BadginationsController < ApplicationController
	before_action :set_badgination, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all
		@badges = Badge.all
		@badginations = Badgination.all
	end

	def show
	end

	def new
		@badgination = Badgination.new
	end

	def edit
	end

	def create
		@badgination = Badgination.create(badgination_params)
		if @badgination.save
			flash[:notice] = "Badge has been assigned."
			redirect_to badginations_path
		else
			flash[:alert] = "Badge has not been added."
			redirect_to badginations_path
		end

	end

	def update

		if @badgination.update(badgination_params)
			flash[:notice] = "Badge has been updated."
			redirect_to @badgination
		else
			flash[:alert] = "Badge has not been updated"
			redirect_to badginations_path
		end

	end

	def destroy
		@badgination.destroy
		redirect_to badginations_path
	end

	private

	def set_badgination
		@badgination = Badgination.find(params[:id])
	end

	def badgination_params
		params.require(:badgination).permit(:user_id, :badge_id, :position)
	end

end