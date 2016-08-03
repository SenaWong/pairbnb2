class UsersController < ApplicationController

	def index
		@users = User.paginate(page: params[:page], per_page: 2)

	end

	def show
		@user = User.find(params[:id])
		@listings = @user.listings.paginate(page: params[:page], per_page: 3)
	end


end