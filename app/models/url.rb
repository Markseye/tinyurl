#next steps add if uniqueness is false, short the short url,
#add error handling, upgrade ui, add url correction as now only exact url enter will redirect so need to have corrections made basedo n user enter

class URL < ActiveRecord::Base
	attr_accessible :long, :short
	validates :long, presence: true, uniqueness: true, format: {with: /\Ahttp:\/\/\S+\z/,
	message: "Only HTTP links allowed!"} #No relative URLs, no file:// URLs, or even shell: URLs
	#validates :short, uniqueness: true
	before_create :create_short

	def create_short
		@shorty = Digest::SHA256.hexdigest(self.long).to_s[0..6].to_i(16).to_s(32)
		self.short="shur.ly/" + @shorty
	end

end
