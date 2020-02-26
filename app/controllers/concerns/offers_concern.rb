module OffersConcern
  extend ActiveSupport::Concern

  def verify_date(offers)
    offers.each do |offer| 
      if Time.now >= offer.starts_at
        offer.update(state: 1)
      end

      if !offer.ends_at.nil?
        if Time.now <= offer.ends_at
          offer.update(state: 0)
        end
      end
        
      ends_at_is_empty(offer)
    end
  end

  def ends_at_is_empty(offer)
    if offer.ends_at.nil?
      offer.update(state: 1)
    end
  end
end