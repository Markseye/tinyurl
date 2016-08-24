require "digest"
require "base64"

class URL < ActiveRecord::Base
	attr_accessible :long, :short
	validates :long, presence: true, uniqueness: true
	#:format => {
	#:with => %r{\Ahttp://\z},
	#:message => "Only HTTP links allowed!", #No relative URLs, no file:// URLs, or even shell: URLs
	#}

	#to not use id upon genrating in db, change to base 36
	#before_create :create_short
	#need to add check to make sure url is unique

	def create_short
		debugger
		self.short = self.long.hexidigest.to_i(16)
	end

end
