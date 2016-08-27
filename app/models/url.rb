#next steps add if uniqueness is false,add error handling, upgrade ui

class URL < ActiveRecord::Base
	attr_accessible :long, :short
	validates :long, presence: true, uniqueness: true, format: {with: /\A^(http|https)\S+\z/,
	message: "Only HTTP links allowed!"} #No relative URLs, no file:// URLs, or even shell: URLs
	#validates :short, uniqueness: true
	before_create :create_short

	def create_short
		#better way to do this rather than just retry
		@shorty = Digest::SHA256.hexdigest(self.long).to_s[0..6].to_i(16).to_s(32)
		self.short="shur.ly/" + @shorty
		if URL.exists?(short: self.short)
			create_short
		end
	end

end