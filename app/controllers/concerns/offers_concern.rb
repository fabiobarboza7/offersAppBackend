module OffersConcern
  extend ActiveSupport::Concern
		

  def verify_date(offer)
    if Time.current >= offer.starts_at
      offer.state = 1
    end

    if Time.current <= offer.ends_at
      offer.state = 0
    end
      
    ends_at_is_empty(offer)
  end

  def ends_at_is_empty(offer)
    if offer.ends_at.nil?
      offer.state = 1
    end
  end
  
end