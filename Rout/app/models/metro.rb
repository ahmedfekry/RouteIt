class Metro < ActiveRecord::Base

	MAX_DISTANCE_AWAY_IN_KM = 100.0
	RAD_PER_DEG             = 0.017453293

	Rmiles  = 3956           # radius of the great circle in miles
	Rkm     = 6371           # radius in kilometers, some algorithms use 6367
	Rfeet   = Rmiles * 5282  # radius in feet
	Rmeters = Rkm * 1000     # radius in meters

	def self.calculate_distance( lat1, lon1, lat2, lon2 )
	  dlon = lon2 - lon1
	  dlat = lat2 - lat1

	  dlon_rad = dlon * RAD_PER_DEG
	  dlat_rad = dlat * RAD_PER_DEG

	  lat1_rad = lat1 * RAD_PER_DEG
	  lon1_rad = lon1 * RAD_PER_DEG

	  lat2_rad = lat2 * RAD_PER_DEG
	  lon2_rad = lon2 * RAD_PER_DEG

	  a = (Math.sin(dlat_rad/2))**2 + Math.cos(lat1_rad) *
	       Math.cos(lat2_rad) * (Math.sin(dlon_rad/2))**2
	  c = 2 * Math.atan2( Math.sqrt(a), Math.sqrt(1-a))

	  dKm     = Rkm * c         # delta in kilometers
	 
	  # { :mi => dMi, :km => dKm, :ft => dFeet, :m => dMeters }
	end

end
