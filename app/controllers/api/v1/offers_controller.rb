module Api
	module V1
		class OffersController < ApplicationController
			include OffersConcern

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
				verify_date(offer)

				if offer.save
					render json: { status: 'success', message:'offer created', data: offer }, status: :ok
				else
					render json: { status: 'error', message:'offers not saved', data: offer.errors.full_messages }, status: 400
				end
			end

			def update
				offer = Offer.find(params[:id])
				if offer.update(offer_params)
					render json: { status: 'success', message:'offer updated', data: offer }, status: :ok
				else
					render json: { status: 'error', message:'offers not updated', data: offer.errors.full_messages }, status: 400
				end
			end

			def change_state
				offer = Offer.find(params[:id])
				if offer.state === 'enabled'
					offer.update(state: 0)
				else 
					offer.update(state: 1)
				end

				if offer.save
					render json: { status: 'success', message:'offer state updated', data: offer }, status: :ok
				else
					render json: { status: 'error', message:'offers state not updated', data: offer.errors.full_messages }, status: 400
				end
			end	
			
			def destroy
				offer = Offer.find(params[:id])
				offer.destroy
				render json: { status: 'success', message:'offer deleted', data: offer }, status: :ok
			end
			
			private
			
			def offer_params
				params.require(:offer).permit(:advertiser_name, :url, :description, :state, :starts_at, :ends_at, :premium)
			end
			
		end
	end
end
