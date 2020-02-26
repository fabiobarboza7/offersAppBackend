class Offer < ApplicationRecord	

	validates :advertiser_name, uniqueness: true, presence: true
	validates :url, :valid_url?, presence: true
	validates :description, length: { maximum: 500 }
	validates :starts_at, presence: true
	enum state: { disabled: 0, enabled: 1 }
	
	private

	def valid_url?
	  uri = URI.parse(self.url) unless self.url.nil?
			
		if uri.is_a?(URI::HTTP) && !uri.host.nil?
			self.url
		else
			errors.add(:url, "is not valid")
		end
	end
end
