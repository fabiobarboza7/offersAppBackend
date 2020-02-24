module Api
	module V1
		class OffersController < ApplicationController

			def index
				offers = Offer.all
				render json: { status: 'success', message:'offers loaded', data: offers }, status: :ok
			end
			
			def show
				offer = Offer.find(params[:id])
				render json: { status: 'success', message:'Loaded offer', data: offer }, status: :ok
			end
			
			def create
				offer = Offer.new(offer_params)
				if offer.save
				render json: { status: 'success', message:'Saved offer', data: offer }, status: :ok
				else
				render json: { status: 'error', message:'offers not saved', data: offer.errors }, status: :unprocessable_entity
				end
			end
			
			def destroy
				offer = Offer.find(params[:id])
				offer.destroy
				render json: { status: 'success', message:'Deleted offer', data: offer }, status: :ok
			end
			
			private
			
			def offer_params
				params.require(:offer).permit(:advertiser_name, :url, :description, :state, :starts_at, :ends_at, :premium)
			end
			
		end
	end
end
