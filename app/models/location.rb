class Location < ActiveRecord::Base

	geocoded_by :my_location
	#ActiveRecord callback. This is run right before saving and after validation
	#several others like before_action, before_validation, before_save, etc.
	after_validation :geocode

	def my_location
		"#{address}, #{city}, GA"
	end

	def self.nearby(lng1, lat1, lng2, lat2)
		if (lng1.to_f-lng2.to_f).abs <= 0.01 && (lat1.to_f-lat2.to_f).abs <= 0.01
			return true
		else
			return false
		end
	end

end
