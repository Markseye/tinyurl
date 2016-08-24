

class URL < ActiveRecord::Base
	attr_accessible :long, :short
	validates :long, presence: true, uniqueness: true
	#:format => {
	#:with => %r{\Ahttp://\z},
	#:message => "Only HTTP links allowed!", #No relative URLs, no file:// URLs, or even shell: URLs
	#}

	#to not use id upon genrating in db, change to base 36
	before_create :create_short
	#need to add check to make sure url is unique

	def create_short
		@shorty = Digest::SHA256.hexdigest(self.long).to_s[0..6].to_i(16).to_s(32)
		self.short="shur.ly/" + @shorty
	end

end
