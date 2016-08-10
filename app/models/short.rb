class Short < ActiveRecord::Base
	attr_accessible :long, :desc
	validates :long, presence: true,
	:format => {
	:with => %r{^http://},
	:multiline => true,
	:message => "Only HTTP links allowed!"  #No relative URLs, no file:// URLs, or even shell: URLs
	}
	#desc on displayed on page dd isnt stored in db

	#to not use id upon genrating in db, change to base 36
	def to_param
		b36_id
	end

	#to keep DRY
	def b36_id
		self.id.to_i.to_s(36)
	end
end
