class ListingsController < ApplicationController
	before_filter :get_user, :except => [:home]

	def home
		@listings = Listing.paginate(page: params[:page], per_page: 5)
	end

	def get_user
		@user = User.find(params[:user_id])
	end

	def index
		@listing = Listing.all
	end

	def new
		@listing = Listing.new
	end

	def create
		@listing = @user.listings.new(listing_params)
		if @listing.save
			# happy path
			redirect_to user_listing_path(@user, @listing)
		else
			# unhappy path
		end
	end

	def show
		@listing = @user.listings.find(params[:id])
	end

	private

	def listing_params
		params.require(:listing).permit(:name, :location, :no_of_rooms)
		
	end

end