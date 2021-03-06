class Moviegoer < ActiveRecord::Base
  	attr_protected :name, :provider, :uid # see text for explanation
  	#attr_accessible :name, :provider, :uid
  	def self.create_with_omniauth(auth)
  		Moviegoer.create!(
			:provider => auth["provider"],
			:uid      => auth["uid"],
			:name     => auth["info"]["name"]
  		)
  	end
end
