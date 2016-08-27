#next steps add if uniqueness is false, short the short url, validate url entered is good,
#add error handling, upgrade ui, add url correction as now only exact url enter will redirect so need to have corrections made basedo n user enter

class URL < ActiveRecord::Base
	attr_accessible :long, :short
	validates :long, presence: true, uniqueness: true
	#validates :short, uniqueness: true
	#:format => {
	#:with => %r{\Ahttp://\z},
	#:message => "Only HTTP links allowed!", #No relative URLs, no file:// URLs, or even shell: URLs
	#}
	before_create :create_short

	def create_short
		@shorty = Digest::SHA256.hexdigest(self.long).to_s[0..6].to_i(16).to_s(32)
		self.short="shur.ly/" + @shorty
	end

end
